require 'hippie'

test 'GET' do
  r = Hippie.get('http://httpbin.org/get', params: { foo: 'bar' })

  assert_equal 200, r.status
  assert_equal ['application/json'], r.headers['content-type']
  assert_equal 'UTF-8', r.encoding.to_s

  assert(r.json['args'] && r.json['args']['foo'] == 'bar')
end
puts 'GET'

test 'POST' do
  r = Hippie.post('http://httpbin.org/post', data: { "plan" => "test" })

  assert_equal 200, r.status
  assert_equal ['application/json'], r.headers['content-type']
  assert_equal 'UTF-8', r.encoding.to_s

  assert(r.json['form'] && r.json['form'] == { 'plan' => 'test' })
end
puts 'POST'

test 'PUT' do
  r = Hippie.put('http://httpbin.org/put', data: { 'plan' => 'test' })

  assert_equal 200, r.status
  assert_equal ['application/json'], r.headers['content-type']
  assert_equal 'UTF-8', r.encoding.to_s

  assert(r.json['form'] && r.json['form'] == { 'plan' => 'test' })
end
puts 'PUT'

test 'DELETE' do
  r = Hippie.delete('http://httpbin.org/delete', data: { 'plan' => 'test' })

  assert_equal 200, r.status
  assert_equal ['application/json'], r.headers['content-type']
  assert_equal 'UTF-8', r.encoding.to_s

  assert(r.json['form'] && r.json['form'] == { 'plan' => 'test' })
end
puts 'DELETE'

test 'HEAD' do
  r = Hippie.head('http://httpbin.org/headers')

  assert_equal 200, r.status
  assert_equal ['application/json'], r.headers['content-type']
  assert_equal 'UTF-8', r.encoding.to_s
end
puts 'HEAD'

test 'OPTIONS' do
  # TODO
end
puts 'OPTIONS'

test 'PATCH' do
  r = Hippie.patch('http://httpbin.org/patch', data: { 'plan' => 'test' })

  assert_equal 200, r.status
  assert_equal ['application/json'], r.headers['content-type']
  assert_equal 'UTF-8', r.encoding.to_s

  assert(r.json['form'] && r.json['form'] == { 'plan' => 'test' })
end
puts 'PATCH'

test 'TRACE' do
  # TODO
end
puts 'TRACE'

test 'Basic Auth' do
  r = Hippie.get('http://httpbin.org/basic-auth/u/p', auth: ['u', 'p'])

  assert_equal r.json['authenticated'], true
  assert_equal r.json['user'], 'u'
end
puts 'Basic Auth'

test 'SSL' do
  response = Hippie.get('https://httpbin.org/get')

  assert_equal 200, response.status
end
puts 'SSL'
