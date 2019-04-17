module DependencyBoundary
  class CLI
    STATUS_SUCCESS     = 0
    STATUS_OFFENSES    = 1
    STATUS_ERROR       = 2

    attr_reader :violations

    def initialize
      @config = {}
    end

    def run(args)
      config_file = args[:config] || '.dependency.yml'

      unless config_file
        print "\e[31mDependency Boundary must be provided a config file."
        exit 0
      end

      files = args[:files] || ['.']
      @files = files.kind_of?(Array) ? files : [files]
      @config = YAML.load_file(config_file)
      @checker = Checker.new(@files, @config, args[:excluded])

      @violations = @checker.execute
      if violations.empty?
        exit STATUS_SUCCESS
      else
        # report any violations
        print_violations
        exit STATUS_OFFENSES
      end
    end

    def print_violations
      print "Violations found"
      violations.each do |violation|
        print "\e[31m\t#{violation.namespace.to_s} was found in #{violation.file}:#{violation.line}\n"
      end
      print "\n\e[31mFound #{violations.size} violation(s) in the project:\n"
    end
  end
end
