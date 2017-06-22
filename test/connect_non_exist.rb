require 'socket'

sock = Socket.new :INET, :STREAM

remote_addr = Socket.pack_sockaddr_in 80, 'google.com'

sock.connect remote_addr
