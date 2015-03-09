module LetterGenerator
  module Generators
    class TexFileGenerator < Thor::Group
      include Thor::Actions

      def self.exit_on_failure?
        true
      end

      class_option :output_file, default: %w(letter.tex), desc: 'Outputfile'
      argument :input_file, required: true

      def generate
        binding.pry
        metadata = LetterMetadata.new(Dir.glob(File.expand_path('*.yaml')).first)

        generator = Generator.new(input_file)
        generator.run(metadata, output_file)
      end
    end
  end
end
