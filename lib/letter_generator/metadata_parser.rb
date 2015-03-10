module LetterGenerator
  class MetadataParser
    def parse(file)
      if file
        data = Psych.load_file(file).deep_symbolize_keys
      else
        data = {}
      end

      Metadata.new(**data)
    end
  end
end
