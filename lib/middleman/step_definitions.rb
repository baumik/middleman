MIDDLEMAN_ROOT_PATH = File.dirname(File.dirname(File.dirname(__FILE__)))
MIDDLEMAN_BIN_PATH  = File.join(MIDDLEMAN_ROOT_PATH, "bin")

require "middleman/step_definitions/middleman_steps"
require "middleman/step_definitions/builder_steps"
require "middleman/step_definitions/generator_steps"
require "middleman/step_definitions/server_steps"