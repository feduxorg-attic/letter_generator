module LetterGenerator
  class Sender
    attr_reader :data

    def initialize(data)
      @data = Hash(data)
    end

    def method_missing(*args)
      data[args.flatten.first.to_sym]
    end
  end
end
