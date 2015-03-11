module LetterGenerator
  class Runner < Thor
    include Thor::Actions

    def self.exit_on_failure?
      true
    end

    class_option :debug_mode, type: :boolean, default: LetterGenerator.config.debug_mode, desc: 'Enabled debug mode'

    option :output_file, default: 'letter-<%= to_s %>.tex', desc: 'Outputfile'
    desc 'generate', 'Generate template'
    def generate
      enable_debug_mode

      invoke 'letter_generator:generators:tex_file_generator', [LetterTemplate.new.file], output_file: options[:output_file]
    end

    option :build_directory, default: 'build', desc: 'Build directory'
    desc 'build', 'Build letter'
    def build
      enable_debug_mode

      invoke :generate, [], output_file: File.join(options[:build_directory], 'letter-<%= to_s %>.tex')

      Dir.chdir File.expand_path(options[:build_directory]) do
        Rake::FileList.new('*.tex').each do |f|
          run %(pdflatex #{f})
        end
      end
    end

    desc 'init', 'Init configuration'
    option :for, default: 'working-directory', enum: %(user working-directory), desc: 'Initialize user configuration'
    def init
      enable_debug_mode

      source_paths << File.expand_path('../../../templates', __FILE__)
      letter_template = LetterTemplate.new

      template_path = File.expand_path(File.join('templates', File.basename(letter_template.file)))

      case options[:for].to_s.to_sym
      when :user || :u
        copy_file letter_template.file, File.join(File.dirname(LetterGenerator.config.preferred_configuration_file), 'templates', File.basename(letter_template.file))
      when :'working-directory' || :wd

        template 'data', File.expand_path('data.yaml')
        copy_file letter_template.file, template_path
      else
        fail ArgumentError, "#{options[:for]} is not a valid value for \"for\"."
      end
    end

    no_commands do
      # Enable debug mode
      def enable_debug_mode
        LetterGenerator.enable_debug_mode if options[:debug_mode] == true
      end
    end
  end
end
