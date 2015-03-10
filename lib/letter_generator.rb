require 'thor'
require 'thor/actions'
require 'thor/group'
require 'tilt'
require 'psych'
require 'active_support'
require 'active_support/core_ext'
require 'fedux_org_stdlib/file_template'
require 'fedux_org_stdlib/app_config'
require 'fedux_org_stdlib/logging/logger'
require 'fedux_org_stdlib/core_ext/string/characterize'

require 'letter_generator/generators/tex_file_generator'
require 'letter_generator/letter_template'
require 'letter_generator/logger'
require 'letter_generator/application_config'
require 'letter_generator/main'

LetterGenerator.enable_debug_mode if ENV.key? 'DEBUG'

require 'letter_generator/version'
require 'letter_generator/logger'
require 'letter_generator/sender'
require 'letter_generator/addressee'
require 'letter_generator/output_file'
require 'letter_generator/metadata_file'
require 'letter_generator/generator'
require 'letter_generator/letter_metadata'
require 'letter_generator/runner'

module LetterGenerator
end
