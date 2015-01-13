module LetterGenerator
  class Runner < Thor
    include Thor::Actions

    option :output_file, default: 'letter.tex', desc: 'Outputfile'

    desc 'generate', 'Generate template'
    def generate
      content = LetterContent.new
      template = LetterTemplate.new

      generator = LetterGenerator.new(template.file)
      generator.run(content, options[:output_file])
    end
  end
end
