require "socket"

server = TCPServer.new 4481

Socket.accept_loop server do |con|
  p con.class
  con.close
end
