module LetterGenerator
  class LetterTemplate < FeduxOrgStdlib::FileTemplate
    def fallback_template_directory
      File.expand_path('../../../templates', __FILE__)
    end
  end
end
