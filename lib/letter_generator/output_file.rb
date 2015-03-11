module LetterGenerator
  class OutputFile
    private

    attr_reader :template

    public

    def initialize(template)
      @template = Tilt::ErubisTemplate.new{ template }
    end

    def path_for(object)
      Pathname.new(File.expand_path(template.render(object.to_s.characterize)))
    end
  end
end
