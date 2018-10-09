class DirectoryScanner

  def initialize(path, regex = /.*\.xctemplate$/)
      @path = path
      @regex = regex
  end

  def scan
    Find.find(@path) do |p|
      yield(p) if FileTest.directory?(p) && p =~ @regex
    end
  end

end
