# encoding: utf-8

require 'uri'
require 'net/http'
require 'openssl'
require_relative 'hippie/response'

module Hippie
  CA_FILE = ENV.fetch('REQUESTS_CA_FILE') {
    File.expand_path('../cacert.pem', __FILE__)
  }

  def self.get(url, **kwargs)
    request('GET', url, **kwargs)
  end

  def self.post(url, data: nil, **kwargs)
    request('POST', url, data: data, **kwargs)
  end

  def self.put(url, data: nil, **kwargs)
    request('PUT', url, data: data, **kwargs)
  end

  def self.delete(url, **kwargs)
    request('DELETE', url, **kwargs)
  end

  def self.head(url, **kwargs)
    request('HEAD', url, **kwargs)
  end

  def self.options(url, **kwargs)
    request('OPTIONS', url, **kwargs)
  end

  def self.patch(url, **kwargs)
    request('PATCH', url, **kwargs)
  end

  def self.trace(url, **kwargs)
    request('TRACE', url, **kwargs)
  end

  private

  def self.request(method, url, headers: {}, data: nil, params: nil, auth: nil)
    fail "No HTTP(S) scheme in: #{url}" unless url =~ /^https?:\/\//i

    uri = URI.parse(URI.encode(url))

    uri.query = URI.encode_www_form(params) if params
    body = process_params(headers: headers, data: data) if data
    basic_auth(headers, *auth) if auth

    response = Net::HTTP.start(uri.host, uri.port, opts(uri)) do |http|
      if method == 'HEAD'
        http.head(uri)
      else
        http.send_request(method, uri, body, headers)
      end
    end

    Response.new(response.code, response.to_hash, response.body)
  end

  def self.opts(uri)
    if uri.scheme == 'https'
      { use_ssl: true,
        verify_mode: OpenSSL::SSL::VERIFY_PEER,
        ca_file: CA_FILE
      }
    end
  end

  def self.basic_auth(headers, user, pass)
    headers['Authorization'] = 'Basic ' + ["#{user}:#{pass}"].pack('m0')
  end

  def self.process_params(headers: nil, data: nil)
    if data.is_a?(Enumerable)
      headers['Content-Type'] = 'application/x-www-form-urlencoded'
      URI.encode_www_form(data)
    else
      data
    end
  end
end
