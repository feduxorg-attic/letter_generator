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

        metadata_file   = MetadataFile.new

        metadata_parser = MetadataParser.new
        metadata        = metadata_parser.parse(metadata_file.path)

        output_file     = OutputFile.new('letter_<%= to_s %>.tex')

        generator = Generator.new(input_file)
        generator.run(metadata, output_file.for('test'))
      end
    end
  end
end
