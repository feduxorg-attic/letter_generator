module LetterGenerator
  class Runner < Thor
    include Thor::Actions

    def self.exit_on_failure?
      true
    end

    class_option :debug_mode, type: :boolean, default: LetterGenerator.config.debug_mode, desc: 'Enabled debug mode'

    option :output_file, default: 'letter.tex', desc: 'Outputfile'
    desc 'generate', 'Generate template'
    def generate
      enable_debug_mode

      binding.pry
      Generators::TexFileGenerator.invoke(LetterTemplate.new.file, output_file: 'letter.tex')
    end

    desc 'init', 'Init local directory'
    def init
      enable_debug_mode

      source_paths << File.expand_path('../../../templates', __FILE__)
      template 'data', File.expand_path('data.yaml')

      template = LetterTemplate.new
      FileUtils.cp template.file, File.expand_path(File.basename(template.file))
    end

    no_commands do
      # Enable debug mode
      def enable_debug_mode
        LetterGenerator.enable_debug_mode if options[:debug_mode] == true
      end
    end
  end
end
