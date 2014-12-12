# Hippie: Simple HTTP wrapper for Net::HTTP

## Installation
```bash
gem install hippie
```

## Usage
Here's an example of a GET request:

```ruby
require 'hippie'

response = Hippie.get("http://example.com")

# Now you have these methods available
response.status  #=> Number with the status code
response.headers #=> Hash with the response headers
response.body    #=> String with the response body
response.error?  #=> true / false
response.valid?  #=> true / false
```

You can also pass parameters with a query string:

```ruby
# GET http://example.com?foo=bar
Hippie.get("http://example.com", params: { foo: "bar" })
```

If you want to send data with a POST request, you can add a `data`
option with the value.

```ruby
Hippie.post("http://example.com", data: "hello world")
```

For Basic Authentication, you can provide the option `auth`, which
should contain an array with the username and password:

```ruby
Hippie.get("http://example.com", auth: ["username", "password"])
```

# Disclaimer
This is a fork of the awesome 'requests' gem from cyx (https://github.com/cyx/requests)
