module LetterGenerator
  class Generator
    private

    attr_reader :template

    public

    def initialize(template_file)
      @template = Tilt::ErubisTemplate.new(template_file)
    end

    def run(metadata, file)
      metadata.to.each do |addressee| 
        path    = file.path_for(addressee.name)
        content = template.render(MetadataProxy.new(addressee, metadata))

        FileUtils.mkdir_p(File.dirname(path))
        File.write(path, content)
      end
    end
  end
end
