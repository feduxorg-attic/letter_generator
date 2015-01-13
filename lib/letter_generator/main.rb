module LetterGenerator
  @logger                      = Logger.new
  @config                      = ApplicationConfig.new(merge_files: true, safe: true)
  @debug_mode                  = false

  class << self
    attr_reader :config, :logger

    private

    attr_accessor :debug_mode

    public

    def debug_mode_enabled?
      debug_mode == true
    end

    def enable_debug_mode
      self.debug_mode = true
      LetterGenerator.config.debugging_libraries.each { |l| require l }
    end
  end
end
