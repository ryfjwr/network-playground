require 'socket'

buffer = 1024 * 100

Socket.tcp_server_loop(4481) do |conn|
  begin
    while data = conn.readpartial(buffer) do
      p data
    end
  rescue EOFError
  end

  conn.close
end


