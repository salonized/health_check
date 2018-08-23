lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "health_check/version"

Gem::Specification.new do |spec|
  spec.name          = "health_check"
  spec.version       = HealthCheck::VERSION
  spec.authors       = ["Danny Hiemstra"]
  spec.email         = ["danny@salonized.com"]

  spec.summary       = %q{Simple health check endpoint and TCP listener.}
  spec.homepage      = "https://www.salonized.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
