module LetterGenerator
  class Sender
    attr_reader :name, :co, :street, :city

    def initialize(name:, street:, city:, co: nil)
      @name   = name
      @street = street
      @city   = city
      @co     = co
    end
  end
end
