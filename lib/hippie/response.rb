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

    def encoding
      @body.encoding
    end

    def succesful?
      @status.between?(200, 299)
    end

    def error?
      !succesful?
    end
  end
end
