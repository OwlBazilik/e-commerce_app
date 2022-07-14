import socket
import json
from datetime import  datetime

def runServer():
    try:
        server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        # http://xxx.xxx.xxx.xxx:2000/popular.json
        #HOST = socket.gethostbyname(socket.gethostname())

        HOST = 'xxx.xxx.xxx.xxx' #<- EDIT HOST HERE
        PORT = 2000
        server.bind((HOST, PORT))
        #server.bind(('192.168.134.110', 2000)) # IP(local host), port(>1024, not conflict)
        # server = socket.create_server(('127.0.0.1', 2000)) - in one line
        server.listen(100)
        while True:
            print(f'Working...')
            client_socket, address = server.accept()
            print(f"Connect to {address}")
            data = client_socket.recv(1024).decode('utf-8')
            print("Client request:")
            print(data)
            type_request = data.split(' ')[1]

            print(type_request)
            content = loadPageFromGetRequest(data)
            print(f"Length data: {len(content)}")
            client_socket.send(content)

            #client_socket.close()
            client_socket.shutdown(socket.SHUT_WR)
            print(f"Request created {datetime.now()}")
    except KeyboardInterrupt:
        server.close()
    print('shutdown server...')

def loadPageFromGetRequest(request_data):
    HDRS = 'HTTP/1.1 200 OK\r\nContent-Type: application/json; charset=utf-8\r\n\r\n'
    HDRS_404 = 'HTTP/1.1 404 OK\r\nContent-Type: application/json; charset=utf-8\r\n\r\n'
    message = 'Sorry, my dear friend, but it\'s fiasco! Type of error => '
    correct_path = 'Correct paths:  (/hi.txt) , (/popular.json) , (/recommended.json)'

    path = request_data.split(' ')[1]
    type_request = request_data.split(' ')[0]
    response = ''
    try:
        with open('data' + path, 'r') as file:
            response = file.read()
            #print(response)
            #response = json.dumps(response)

            print(type(response))
            print(f"Length data f: {len(response)}")

        return HDRS.encode('utf-8') + bytes(response, 'utf-8')

    except (FileNotFoundError):
        return (HDRS_404 + message + 'FileNotFoundError. ' + correct_path).encode('utf-8')
    except (IsADirectoryError):
        return (HDRS_404 + message + 'IsADirectoryError. ' + correct_path).encode('utf-8')
    except (NotADirectoryError):
        return (HDRS_404 + message + 'NotADirectoryError. ' + correct_path).encode('utf-8')



if __name__ == '__main__':
    runServer()

