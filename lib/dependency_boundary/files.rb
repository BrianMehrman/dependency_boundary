module DependencyBoundary
  class Files
    def initialize(excluded=nil)
      @excluded = excluded
    end

    def get_files(prefix = '.')
      files = Dir.glob("#{prefix}/**/*.rb")
      files -= Dir.glob(ignored_files(prefix))
      files
    end

    def ignored_files(prefix = '.')
      excluded = @excluded || ["#{prefix}/tmp"]
      excluded = [excluded] if excluded.kind_of?(String)
      excluded.flat_map do |file|
        if ::File.file?(file)
          file
        elsif ::File.directory?(file)
          "#{file}/**/*.rb"
        end
      end
    end
  end
end
