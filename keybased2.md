
sequenceDiagram
    participant Client as SSH Client (Private Key)
    participant Server as SSH Server (Authorized Keys)

    Client->>Server: ssh user@server
    Server->>Server: Check ~/.ssh/authorized_keys
    Server-->>Client: Send random challenge
    Client->>Client: Hash challenge (SHA-256)
    Client->>Client: Sign hash with private key
    Client-->>Server: Send signature
    Server->>Server: Verify signature with public key
    Server-->>Client: ✅ Login success
