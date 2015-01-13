module LetterGenerator
  class ApplicationConfig < FeduxOrgStdlib::AppConfig
    option :template, LetterTemplate.new.file
    option :debugging_libraries, %w(pry byebug)

    def _application_name
      'letter_generator'
    end

    def _config_name
      'application'
    end

  end
end
