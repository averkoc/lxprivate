## demoserver for WS1 network configuration alternatives (app2.py in demodep server)

To run this in demodeb VM use script startdemo.sh in student homedir. It moves to demo directory and activates the virtualenv before issuing python3 app2.py 
````python
from flask import Flask, request
import subprocess
import socket
import ipaddress
from user_agents import parse

app = Flask(__name__)

def get_all_server_ips():
    result = subprocess.run(['hostname', '-I'], capture_output=True, text=True)
    return result.stdout.strip().split()

def is_same_network(ip1, ip2):
    ip1_network = ipaddress.ip_network(ip1 + '/24', strict=False)
    ip2_network = ipaddress.ip_network(ip2 + '/24', strict=False)
    return ip1_network == ip2_network

@app.route('/')
def index():
    user_ip = request.remote_addr
    server_ips = get_all_server_ips()
    server_hostname = socket.gethostname()
    user_ip_html = f'<b>{user_ip}</b>' if any(is_same_network(user_ip, ip) for ip in server_ips) else user_ip
    server_ips_html = ''.join([
        f'<tr><td>Server IP address:</td><td>{"<b>" + ip + "</b>" if is_same_network(user_ip, ip) else ip}</td></tr>'
        for ip in server_ips
    ])

    user_agent = request.headers.get('User-Agent')
    parsed_user_agent = parse(user_agent)
    os_info = parsed_user_agent.os.family
    browser_info = parsed_user_agent.browser.family

    return f'''
        <style>
            body {{
                font-size: 20px;
            }}
            table {{
                width: 100%;
                border-collapse: collapse;
                font-size: 24px;
            }}
            th, td {{
                padding: 8px;
                text-align: left;
                border: 1px solid #ddd;
            }}
            @media screen and (max-width: 600px) {{
                body {{
                    font-size: 22px;
                }}
                table {{
                    width: 100%;
                    font-size: 22px;
                }}
                th, td {{
                    display: block;
                    width: 100%;
                }}
                th {{
                    background-color: #f2f2f2;
                }}
            }}
        </style>
        <h1>This page comes from <br>{server_hostname}-server</h1>
        <table>
            <tr>
                <th colspan="2">Client Information</th>
            </tr>
            <tr>
                <td>Your IP address:</td>
                <td>{user_ip_html}</td>
            </tr>
            <tr>
                <td>Your Operating System:</td>
                <td>{os_info}</td>
            </tr>
            <tr>
                <td>Your Browser:</td>
                <td>{browser_info}</td>
            </tr>
            <tr>
                <th colspan="2">Server Information</th>
            </tr>
            {server_ips_html}
        </table>
    '''

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)

````
