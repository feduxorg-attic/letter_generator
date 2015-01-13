module LetterGenerator
  class Generator
    private

    attr_reader :template

    public

    def initialize(template_file)
      @template = Tilt::ErubisTemplate.new(template_file)
    end

    def run(data, file)
      File.write(file, template.render(data))
    end
  end
end
