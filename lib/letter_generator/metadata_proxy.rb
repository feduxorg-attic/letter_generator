module LetterGenerator
  class MetadataProxy < Delegator
    attr_reader :to

    def initialize(to, obj)
      @to              = to
      @delegate_sd_obj = obj
    end

    def __getobj__
      @delegate_sd_obj
    end

    def __setobj__(obj)
      @delegate_sd_obj = obj
    end
  end
end

