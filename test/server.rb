require "socket"

module CloudHash
  class Server
    def initialize(port)
      @server = TCPServer.new port
      p "Listening on port #{@server.local_address.ip_port}"
      @storage = {}
    end

    def start
      Socket.accept_loop(@server) do |conn|
        handle conn
        puts conn
        conn.close
      end
    end

    def handle(con)
      req = con.read
      con.write process(req)
    end

    def process(req)
      command, key, val = req.split
      case command.upcase
      when 'GET'
        @storage[key]
      when 'SET'
        @storage[key] = val
      end
    end

  end
end

server = CloudHash::Server.new 4481
server.start
