# HealthCheck

Simple health check endpoint and TCP listener.

## Installation

```ruby
gem 'health_check', github: 'salonized/health_check'
```

### Health check HTTP endpoint

Add the following to `config/application.rb` or `config/environments/production.rb`.

```ruby
config.middleware.insert_before Rails::Rack::Logger, HealthCheck::Middleware, options
```

Or to your `config.ru` for plain Rack.

```ruby
use HealthCheck::Middleware, endpoint: '/ping', status_code: 200
```

### Configuration

The following options are accepted (printed with their defaults).

```ruby
{
  endpoint: '/ping',
  response_status: 200,
  response_body: 'OK'
}
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
