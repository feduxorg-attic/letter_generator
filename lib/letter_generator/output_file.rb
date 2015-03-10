module LetterGenerator
  class OutputFile
    private

    attr_reader :template

    public

    def initialize(template)
      @template = Tilt::ErubisTemplate.new(template)
    end

    def path(object)
      Pathname.new(File.join(Dir.getwd, template.result(object.to_s.characterize)))
    end
  end
end
