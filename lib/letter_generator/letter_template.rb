module LetterGenerator
  class LetterTemplate
    attr_reader :file

    def initialize
      @file = Dir.glob(File.expand_path('*.erb')).first
    end
  end
end
