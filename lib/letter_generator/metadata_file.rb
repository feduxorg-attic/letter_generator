module LetterGenerator
  class MetadataFile
    attr_reader :path

    def initialize(path = Dir.glob(File.expand_path('*.yaml')).first)
      @path = path
    end
  end
end
