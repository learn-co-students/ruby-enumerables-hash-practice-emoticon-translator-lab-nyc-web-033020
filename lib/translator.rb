# require modules here
require "yaml"

def load_library(file_path)
  # code goes here
  library = YAML.load_file(file_path)
  # library.each_value { |(english, japanese)| puts "#{english} and #{japanese}" }
  hash = {
    'get_meaning' => create_hash(library, 'japanese'),
    'get_emoticon' => create_hash(library, 'english')
  }
  hash
end

def create_hash(library, language)
  hash = {}
  if language == 'english'
    library.each_value { |(english, japanese)| hash[english] = "#{japanese}" }
  else
    library.each_pair { |key, (english, japanese)| hash[japanese] = "#{key}" }
  end
  hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  hash = load_library(file_path)
  if hash['get_emoticon'][emoticon]
    return hash['get_emoticon'][emoticon]
  else
    return 'Sorry, that emoticon was not found'
  end
end

def get_english_meaning(file_path, emoticon)
  # code goes here
 hash = load_library(file_path)
  if hash['get_meaning'][emoticon]
    return hash['get_meaning'][emoticon]
  else
    return 'Sorry, that emoticon was not found'
  end
end
