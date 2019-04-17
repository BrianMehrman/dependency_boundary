require 'yaml'

module DependencyBoundary
  RSpec.describe Checker do
    let(:config) { YAML.load_file('./spec/dummy/.dependency_config.yml') }
    let(:files)  { ['./spec/dummy'] }
    let(:checker) { Checker.new(files, config) }

    it 'finds a boundary violation' do
      violations = checker.execute
      binding.pry

      expect(violations.size).to eq(1)
    end
  end
end
