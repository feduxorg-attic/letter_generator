module LetterGenerator
  class Runner < Thor
    include Thor::Actions

    def self.exit_on_failure?
      true
    end

    option :output_file, default: 'letter.tex', desc: 'Outputfile'

    desc 'generate', 'Generate template'
    def generate
      content = LetterContent.new
      template = LetterTemplate.new

      generator = Generator.new(template.file)
      generator.run(content, options[:output_file])
    end

    desc 'init', 'Init local directory'
    def init
      source_paths << File.expand_path('../../../templates', __FILE__)
      template 'data', File.expand_path('data.yaml')
    end
  end
end
