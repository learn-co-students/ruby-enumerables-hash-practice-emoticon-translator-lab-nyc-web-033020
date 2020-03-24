require "yaml"
require "Pry"

def load_library(file_path)
  library = YAML.load_file(file_path)
  result = {
    :get_meaning => {},
    :get_emoticon => {}
  }
  binding.pry

end

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end

load_library
