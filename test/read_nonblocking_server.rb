require 'socket'

Socket.tcp_server_loop 4481 do |conn|
  loop do
    begin
      puts conn.read_nonblock 4069
    rescue Errno::EAGAIN
      puts "EAGAIN...#{Time.now.to_s}"
      retry
    rescue EOFError
      break
    end
  end
  conn.close
end
