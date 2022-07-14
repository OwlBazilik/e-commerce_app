import socket

HOST = 'xxx.xxx.xxx.xxx'
PORT = 2000

def runRequest():
    to_run = True
    file = ''

    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client.connect((HOST, PORT))

    msg_0 = '/hi.txt'
    msg_1 = '/popular.json'
    msg_2 = '/recommended.json'

    print("Choise request:")
    print("1 -> popular.json")
    print("2 -> recommended.json")

    def request_fun():
        req = input("You choise: ")

        if req == '1':
            txt_req = msg_1
        elif req == '2':
            txt_req = msg_2
        elif req == 'close':
            to_run = False
        else:
            txt_req = request_fun()

        print()
        return txt_req

    txt_req =  request_fun()

    if to_run:
        client.send((f"CLI {txt_req}").encode('utf-8'))
        data = client.recv(1024).decode('utf-8')
        while data:
            file += data
            data = client.recv(1024).decode('utf-8')

        print("Server answer:")
        print(file)

    print()
    print("Client finish your work.")
    client.close()


if __name__ == '__main__':
    runRequest()
