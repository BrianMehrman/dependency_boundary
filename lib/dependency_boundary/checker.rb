require 'rubrowser/data'

Rubrowser::Data.class_eval do
  def parse
    parsers.each(&:parse)

    @definitions ||= parsers.map(&:definitions).compact.reduce(:+).to_a
    @relations ||= parsers.map(&:relations).compact.reduce(:+).to_a

    mark_circular_dependencies
  end
end

module DependencyBoundary
  class Checker

    attr_reader :violations

    def initialize(files, config, excluded=nil)
      @files = get_files(files, excluded)

      @data = Rubrowser::Data.new(@files)
      @config = config
      @violations = []
    end

    def execute
      relations.each do |relation|
        @violations << relation unless in_bounds?(relation)
      end

      @violations
    end

    private

    def relations
      @relations ||= @data.relations
    end

    def get_files(files, excluded)
      files.flat_map do |file|
        if ::File.file?(file)
          [file]
        elsif ::File.directory?(file)
          _files = Files.new(excluded)
          _files.get_files(file)
        end
      end
    end

    def root_namespace(namespace)
      namespace&.namespace&.first.to_s
    end

    def in_bounds?(relation)
      _caller = root_namespace(relation.caller_namespace)
      _callee = root_namespace(relation.namespace)

      binding.pry if relation.file == '/Users/brian.mehrman/projects/centro-media-manager/components/dsp/spec/controllers/dsp/inventory_sources_controller_spec.rb'
      return true unless @config[_caller] && @config[_callee]
      @config[_caller].include?(_callee)
    end
  end
end
