# LXCheck Portal Deployment Guide

This guide will help you deploy your own copy of the LXCheck results portal on Cloudflare Pages with D1 database.

## Prerequisites

- A GitHub account (for hosting the code)
- A Cloudflare account (free tier is sufficient)
- Basic familiarity with copying/pasting and following web instructions

## Overview

The portal consists of:
- **Frontend**: `docs/results/index.html` - Results viewing page
- **Backend API**: 
  - `docs/functions/api/results.ts` - Results endpoint
  - `docs/functions/api/init-db.ts` - Database setup endpoint
  - `docs/functions/_middleware.js` - Authentication middleware
- **Configuration**: 
  - `wrangler.toml` - Cloudflare settings
  - `package.json` - Dependencies

## Step 1: Get the Portal Code

1. Fork or copy the portal files to your own GitHub repository
2. You need these files and folders:
   ```
   docs/
     functions/
       _middleware.js
       api/
         results.ts
         init-db.ts
     results/
       index.html
   wrangler.toml
   package.json
   ```

## Step 2: Generate API Token

The API token is used by lxcheck clients to submit results securely.

**Option A: Using the helper script (Linux/Mac)**
```bash
bash generate-token.sh
```

**Option B: Generate manually**
- Linux/Mac: Run in terminal: `openssl rand -hex 32`
- Online: Use https://www.random.org/strings/ (generate one string, 64 characters, hex)
- Save this token somewhere safe - you'll need it twice:
  1. For Cloudflare environment variable
  2. For your lxcheck client configuration

## Step 3: Configure Authentication Credentials

You need to set two types of credentials:

### 3.1 Basic Auth (for web access)

Edit `docs/functions/_middleware.js` around lines 40-41:

```javascript
const VALID_USER = "your-username";
const VALID_PASS = "your-secure-password";
```

- Replace `"your-username"` with your desired username
- Replace `"your-secure-password"` with a strong password
- These credentials protect the web interface at `/results`

### 3.2 Push to GitHub

Commit and push your changes:
```bash
git add docs/functions/_middleware.js
git commit -m "Configure authentication"
git push
```

## Step 4: Create Cloudflare Account

1. Go to https://dash.cloudflare.com/sign-up
2. Create a free account (no credit card required)
3. Verify your email

## Step 5: Create D1 Database

1. Log in to Cloudflare Dashboard: https://dash.cloudflare.com/
2. Click **"Workers & Pages"** in the left sidebar
3. Click **"D1 SQL Database"** tab
4. Click **"Create database"** button
5. Database name: `lxcheck-results`
6. Click **"Create"**
7. After creation, you'll see the database. Click on it.
8. **IMPORTANT**: Copy the **Database ID** (looks like: `f48cc268-0cf3-412d-90d8-07cfa309a2bd`)

## Step 6: Update Configuration File

Edit `wrangler.toml` and update line 14 with your database ID:

```toml
[[d1_databases]]
binding = "DB"
database_name = "lxcheck-results"
database_id = "YOUR-DATABASE-ID-HERE"  # Replace with your actual database ID
```

Commit and push:
```bash
git add wrangler.toml
git commit -m "Configure D1 database"
git push
```

## Step 7: Deploy to Cloudflare Pages

### 7.1 Create Pages Project

1. In Cloudflare Dashboard, go to **"Workers & Pages"**
2. Click **"Create application"**
3. Select **"Pages"** tab
4. Click **"Connect to Git"**
5. Authorize Cloudflare to access your GitHub account
6. Select your repository
7. Configure build settings:
   - **Project name**: Choose a name (e.g., `lxcheck-portal`)
   - **Production branch**: `main` (or your default branch)
   - **Build command**: Leave empty (we're using pre-built static files)
   - **Build output directory**: `docs`
8. Click **"Save and Deploy"**

Wait for the initial deployment to complete (1-2 minutes).

### 7.2 Configure Environment Variables

1. Go to your Pages project
2. Click **"Settings"** tab
3. Click **"Environment variables"** in the left menu
4. Click **"Add variables"** (or "Edit variables")
5. Add the following:
   - **Variable name**: `LXCHECK_API_TOKEN`
   - **Value**: Paste the API token you generated in Step 2
   - **Environment**: Select "Production" (and "Preview" if you want)
6. Click **"Save"**

### 7.3 Add D1 Database Binding

1. Still in **"Settings"**, scroll to **"Functions"** section
2. Find **"D1 database bindings"**
3. Click **"Add binding"**
4. Configure:
   - **Variable name**: `DB`
   - **D1 database**: Select `lxcheck-results` (the database you created)
5. Click **"Save"**

### 7.4 Redeploy

After adding environment variables and bindings, you need to redeploy:

1. Go to **"Deployments"** tab
2. Find the latest deployment
3. Click the three dots menu (⋮)
4. Click **"Retry deployment"** or **"Redeploy"**

## Step 8: Initialize Database

After successful deployment, you need to create the database schema:

1. Find your site URL (something like: `https://lxcheck-portal.pages.dev`)
2. Visit: `https://YOUR-SITE.pages.dev/api/init-db`
3. Enter your Basic Auth credentials (from Step 3.1)
4. You should see: `{"success": true, "message": "Database initialized successfully"}`

**If you see an error**, check:
- D1 binding is correctly configured (`DB`)
- You redeployed after adding the binding
- The database ID in `wrangler.toml` matches your actual database

## Step 9: Test the Portal

### 9.1 Test Web Interface

1. Visit: `https://YOUR-SITE.pages.dev/results/`
2. Enter your Basic Auth credentials
3. You should see the results dashboard (it will be empty at first)

### 9.2 Test API (Optional)

Test with curl:
```bash
# Test GET (should work without token when behind Basic Auth)
curl https://YOUR-SITE.pages.dev/api/results

# Test POST (requires Bearer token)
curl -X POST https://YOUR-SITE.pages.dev/api/results \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR-API-TOKEN" \
  -d '{
    "student_id": "test123",
    "assignment": "test",
    "success": true,
    "score": 0,
    "message": "Test submission"
  }'
```

## Step 10: Configure LXCheck Client

Update your lxcheck client configuration to use your new portal:

1. Set the API endpoint: `https://YOUR-SITE.pages.dev/api/results`
2. Set the API token (from Step 2)

## Troubleshooting

### Database errors
- **Problem**: 500 errors when accessing `/api/results`
- **Solution**: 
  1. Check D1 binding is set to variable name `DB`
  2. Make sure you ran `/api/init-db` successfully
  3. Redeploy after adding bindings

### Authentication errors
- **Problem**: 401 Unauthorized for POST requests
- **Solution**: 
  1. Verify LXCHECK_API_TOKEN is set in environment variables
  2. Redeploy after adding environment variables
  3. Make sure client is sending `Authorization: Bearer YOUR-TOKEN`

### Basic Auth not working
- **Problem**: Can't access `/results/` page
- **Solution**:
  1. Check credentials in `_middleware.js` are correct
  2. Make sure changes are committed and deployed
  3. Try in incognito/private browsing mode

### Changes not appearing
- **Problem**: Code changes don't show up on the site
- **Solution**:
  1. Make sure you committed and pushed to GitHub
  2. Check Cloudflare triggered a new deployment (Deployments tab)
  3. If not, manually retry deployment
  4. Clear browser cache

## Updating the Portal

When you want to update the portal code:

1. Make changes to your local files
2. Commit and push to GitHub
3. Cloudflare will automatically detect the push and redeploy
4. Check the **"Deployments"** tab to monitor progress

## Custom Domain (Optional)

To use your own domain (e.g., `lxcheck.youruniversity.edu`):

1. In Pages project, go to **"Custom domains"** tab
2. Click **"Set up a custom domain"**
3. Enter your domain
4. Follow the DNS configuration instructions
5. Cloudflare will provide free SSL certificate

## Security Notes

1. **API Token**: Keep this secret! Anyone with this token can submit results
2. **Basic Auth**: Change the default credentials immediately
3. **HTTPS**: Cloudflare provides automatic HTTPS - always use it
4. **Database**: D1 database is private and only accessible via your Functions

## Cost

Cloudflare Free Tier includes:
- ✅ Unlimited requests for Pages
- ✅ 100,000 D1 reads/day
- ✅ 50,000 D1 writes/day  
- ✅ Free SSL certificate
- ✅ Unlimited bandwidth

This is sufficient for most classroom uses. If you exceed these limits, Cloudflare will contact you.

## Support

If you encounter issues:
1. Check the troubleshooting section above
2. Review Cloudflare Pages logs in the dashboard
3. Verify all configuration steps were completed
4. Check that all files are present in your repository

---

## Quick Reference

**Your Configuration Checklist:**
- [ ] Generated API token
- [ ] Updated `_middleware.js` with Basic Auth credentials
- [ ] Created D1 database in Cloudflare
- [ ] Updated `wrangler.toml` with database ID
- [ ] Pushed all changes to GitHub
- [ ] Created Cloudflare Pages project
- [ ] Added LXCHECK_API_TOKEN environment variable
- [ ] Added D1 database binding (variable: `DB`)
- [ ] Redeployed after adding bindings
- [ ] Visited `/api/init-db` to create schema
- [ ] Tested `/results/` page with Basic Auth
- [ ] Configured lxcheck client with new endpoint and token

**Your Credentials:**
- Site URL: `https://_____.pages.dev`
- Basic Auth Username: `_____`
- Basic Auth Password: `_____`
- API Token: `_____` (keep secret!)
- Database ID: `_____`
