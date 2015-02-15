module LetterGenerator
  class Runner < Thor
    include Thor::Actions

    def self.exit_on_failure?
      true
    end

    option :output_file, default: 'letter.tex', desc: 'Outputfile'
    desc 'generate', 'Generate template'
    def generate
      require 'pry'
      binding.pry
      Generators::TexFileGenerator.invoke(LetterTemplate.new.file, output_file: 'letter.tex')
    end

    desc 'init', 'Init local directory'
    def init
      source_paths << File.expand_path('../../../templates', __FILE__)
      template 'data', File.expand_path('data.yaml')

      template = LetterTemplate.new
      FileUtils.cp template.file, File.expand_path(File.basename(template.file))
    end
  end
end
