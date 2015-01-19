# encoding: utf-8

require 'json'

module Hippie
  class Response
    attr_reader :status, :headers, :body

    def initialize(status, headers, body)
      @status   = status.to_i
      @headers  = headers
      @body     = body.to_s
    end

    def json
      JSON.parse(@body)
    end

    def information?
      @status.between?(100, 199)
    end

    def success?
      @status.between?(200, 299)
    end

    def redirection?
      @status.between?(300, 399)
    end

    def client_error?
      @status.between?(400, 499)
    end

    def server_error?
      @status.between?(500, 599)
    end

    def error?
      @status.between?(400, 599)
    end
  end
end
