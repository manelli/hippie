# Hippie
### _Simple HTTP client for ruby_
---

## Installation

    $ gem install hippie

## Usage
Here's an example of a GET request:

```ruby
require 'hippie'

response = Hippie.get('http://example.com')
response.class #=> Hippie::Response

response.status  #=> Number with the status code
response.headers #=> Hash with the response headers
response.body    #=> String with the response body
response.json    #=> String with the response body parsed to json

response.information?  #=> 1xx response
response.success?      #=> 2xx response
response.redirection?  #=> 3xx response
response.client_error? #=> 4xx response
response.server_error? #=> 5xx response
response.error?        #=> 4xx or 5xx
```

You can also pass parameters with a query string:

```ruby
Hippie.get('http://example.com', params: { foo: 'bar' })
```

If you want to send data with a POST request, you can add a `data` option with the value.

```ruby
Hippie.post('http://example.com', data: 'hello world')
```

For Basic Authentication, you can provide the option `auth`, which
should contain an array with the username and password:

```ruby
Hippie.get('http://example.com', auth: ['username', 'password'])
```

## Available methods
- GET
- POST
- PUT
- DELETE
- HEAD
- OPTIONS
- PATCH
- TRACE

### Disclaimer
This is a fork of the awesome 'requests' gem from cyx (https://github.com/cyx/requests)
