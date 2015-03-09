module LetterGenerator
  class LetterMetadata
    private

    attr_reader :data

    public

    def initialize(file)
      if file
        @data = Psych.load_file(file).deep_symbolize_keys
      else
        @data = {}
      end
    rescue
      @data = {}
    end

    def from
      @from ||= Sender.new(data[:from])
    end

    def to
      @to ||= Addressee.new(data[:to])
    end

    def opening
      data.fetch(:opening, 'Sehr geehrte Damen und Herren,')
    end

    def closing
      data.fetch(:closing, 'Mit freundlichen Grüßen')
    end

    def attachments
      Array(data[:attachments])
    end

    def postscriptum
      data[:postscriptum]
    end

    def text
      data[:text]
    end

    def signature
      data[:signature]
    end

    def subject
      data[:subject]
    end

    %i(subject signature postscriptum text attachments closing opening).each do |m|
      define_method "#{m}?" do
        !m.blank?
      end
    end
  end
end
