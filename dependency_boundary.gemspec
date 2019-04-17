
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dependency_boundary/version"

Gem::Specification.new do |spec|
  spec.name          = "dependency_boundary"
  spec.version       = DependencyBoundary::VERSION
  spec.authors       = ["brianmehrman"]
  spec.email         = ["brian.mehrman@centro.net"]

  spec.summary       = 'checks the boundaries of the contants'
  spec.description   = 'something should go here'
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)

    spec.metadata["source_code_uri"] = "Put your gem's public repo URL here."
    spec.metadata["changelog_uri"] = "Put your gem's CHANGELOG.md URL here."
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.executables   = ["dependencies"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rubrowser", "~> 2.7.1"
  spec.add_runtime_dependency "thor", "= 0.19.4"

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
