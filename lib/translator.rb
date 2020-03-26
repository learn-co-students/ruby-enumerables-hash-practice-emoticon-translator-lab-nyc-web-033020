require "yaml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)

  emoticon_library = {
  :get_meaning => {},
  :get_emoticon => {}
  }

  emoticons.each do |k, v|
    emoticon_library[:get_meaning][v[1]] = k
    emoticon_library[:get_emoticon][v[0]] = emoticons[k][1]
  end
  emoticon_library
end

def get_japanese_emoticon(file_path, emoticon)
  emote = load_library(file_path)[:get_emoticon][emoticon]
  emote ? emote : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  meaning = load_library(file_path)[:get_meaning][emoticon]
  meaning ? meaning : "Sorry, that emoticon was not found"
end