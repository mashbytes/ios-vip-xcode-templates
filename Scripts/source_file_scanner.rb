require 'find'

class SourceFileScanner

    def initialize(path, regex = /.*\.swift$/)
        @path = path
        @regex = regex
    end

    def scan
      Find.find(@path) do |p|
        yield(p) if p =~ @regex
      end
    end

end
