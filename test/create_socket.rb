require "socket"

socket = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM)

addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')

socket.bind addr
