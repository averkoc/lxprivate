#!/bin/bash
# LXCheck Portal - API Token Generator
# Generates a secure random token for API authentication

echo "=========================================="
echo "  LXCheck Portal - Token Generator"
echo "=========================================="
echo ""
echo "Generating secure API token..."
echo ""

# Generate 32-byte (256-bit) token in hexadecimal format
TOKEN=$(openssl rand -hex 32)

echo "✅ Your API Token:"
echo ""
echo "    $TOKEN"
echo ""
echo "=========================================="
echo ""
echo "📋 Next Steps:"
echo ""
echo "1. SAVE THIS TOKEN - you'll need it in two places:"
echo ""
echo "   a) Cloudflare Dashboard:"
echo "      → Workers & Pages → Your Project → Settings"
echo "      → Environment Variables → Add variable"
echo "      → Name: LXCHECK_API_TOKEN"
echo "      → Value: (paste token above)"
echo ""
echo "   b) LXCheck Client Configuration:"
echo "      → Use this token in your lxcheck config"
echo "      → Clients will send: Authorization: Bearer <token>"
echo ""
echo "2. Keep this token SECRET!"
echo "   → Don't commit it to git"
echo "   → Don't share it publicly"
echo "   → Anyone with this token can submit results"
echo ""
echo "=========================================="
