# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-in_elb_healthcheck"
  spec.version       = "0.0.3"
  spec.authors       = ["aihara"]
  spec.email         = ["s.aihara@gmail.com"]

  spec.summary       = %q{fluentd plug-in for ELB Health Check}
  spec.description   = %q{fluentd plug-in for ELB Health Check}
  spec.homepage      = "http://argmax.jp"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  end

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "fluentd", ">= 0.10.00"
end
