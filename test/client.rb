require 'socket'

module CloudHash
  class Client
    class << self
      attr_accessor :host, :port
    end

    def self.get(key)
      req "GET #{key}"
    end

    def self.set(k, v)
      req "SET #{k} #{v}"
    end

    def self.req(str)
      @client = TCPSocket.new(host, port)
      @client.write str

      @client.close_write
      @client.read
    end
  end
end

CloudHash::Client.host = 'localhost'
CloudHash::Client.port = 4481

puts CloudHash::Client.set 'prez', 'obama'
puts CloudHash::Client.get 'prez'
puts CloudHash::Client.get 'vp'
