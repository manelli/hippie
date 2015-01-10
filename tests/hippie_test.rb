# encoding: utf-8

require 'minitest/autorun'
require_relative '../lib/hippie'

class TestHippie < Minitest::Test
  def test_get
    r = Hippie.get('http://httpbin.org/get', params: { foo: 'bar' })

    assert_equal true, r.success?
    assert_equal ['application/json'], r.headers['content-type']
    assert(r.json['args'] && r.json['args']['foo'] == 'bar')
  end

  def test_post
    r = Hippie.post('http://httpbin.org/post', data: { 'plan' => 'test' })

    assert_equal true, r.success?
    assert_equal ['application/json'], r.headers['content-type']
    assert(r.json['form'] && r.json['form'] == { 'plan' => 'test' })
  end

  def test_put
    r = Hippie.put('http://httpbin.org/put', data: { 'plan' => 'test' })

    assert_equal true, r.success?
    assert_equal ['application/json'], r.headers['content-type']
    assert(r.json['form'] && r.json['form'] == { 'plan' => 'test' })
  end

  def test_delete
    r = Hippie.delete('http://httpbin.org/delete', data: { 'plan' => 'test' })

    assert_equal true, r.success?
    assert_equal ['application/json'], r.headers['content-type']
    assert(r.json['form'] && r.json['form'] == { 'plan' => 'test' })
  end

  def test_head
    r = Hippie.head('http://httpbin.org/headers')

    assert_equal true, r.success?
    assert_equal ['application/json'], r.headers['content-type']
  end

  def test_options
    # TODO
  end

  def test_patch
    r = Hippie.patch('http://httpbin.org/patch', data: { 'plan' => 'test' })

    assert_equal true, r.success?
    assert_equal ['application/json'], r.headers['content-type']
    assert(r.json['form'] && r.json['form'] == { 'plan' => 'test' })
  end

  def test_trace
    # TODO
  end

  def test_basic_auth
    r = Hippie.get('http://httpbin.org/basic-auth/u/p', auth: ['u', 'p'])

    assert_equal true, r.success?
    assert_equal true, r.json['authenticated']
    assert_equal  'u', r.json['user']
  end

  def test_ssl
    r = Hippie.get('https://httpbin.org/get')

    assert_equal true, r.success?
  end

  def test_raises_invalid_uri
    assert_raises(URI::InvalidURIError) {
      Hippie.get('www.httpbin.org/get')
    }
  end
end
