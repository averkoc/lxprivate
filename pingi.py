import socket
import threading

def get_own_ip():
    """Get and display the IP address of the host."""
    host_name = socket.gethostname()
    host_ip = socket.gethostbyname(host_name)
    return host_ip

def send_ping():
    """Send a ping message containing the sender's IP address."""
    target_ip = input("\nEnter the IP address of the target computer: ")
    target_port = 12345  # Port to send the message to
    sender_ip = get_own_ip()
    message = f"Ping from {sender_ip}"
    
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        sock.sendto(message.encode(), (target_ip, target_port))
        print(f"Message sent to {target_ip}:{target_port}")
    except Exception as e:
        print(f"Error sending message: {e}")
    finally:
        sock.close()

def receive_ping():
    """Listen for incoming ping messages."""
    listen_port = 12345
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.bind(("0.0.0.0", listen_port))  # Listen on all network interfaces
    print(f"Listening for messages on port {listen_port}...")

    while True:
        try:
            data, addr = sock.recvfrom(1024)  # Buffer size is 1024 bytes
            print(f"Received message: '{data.decode()}' from {addr}")
        except Exception as e:
            print(f"Error receiving message: {e}")
            break

# Main function to run both sender and receiver
def main():
    print("Starting Ping Tool")
    
    # Display the host's IP address at the start
    my_ip = get_own_ip()
    print(f"Your IP Address: {my_ip}")
    
    # Start receiver in a separate thread
    threading.Thread(target=receive_ping, daemon=True).start()
    
    # Loop for sending pings
    while True:
        send_ping()

if __name__ == "__main__":
    main()
