require 'yaml'
require 'pry'

def load_library(file)
  emoticons = YAML.load_file('./lib/emoticons.yml')
  emotes = {
    :get_meaning => {},
    :get_emoticon => {}
  }

  emoticons.each do |meaning, value|
    english = value[0]
    japan = value[1]
    emotes[:get_meaning][japan] = meaning
    emotes[:get_emoticon][english] = japan
  end
  emotes
end

def get_japanese_emoticon(file  = './lib/emoticons.yml', emoticons)
  emotes = load_library(file)
  if emotes[:get_emoticon].include?(emoticons)
    emotes[:get_emoticon][emoticons]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file  = './lib/emoticons.yml', emoticons)
  emotes = load_library(file)
  if emotes[:get_meaning].include?(emoticons)
    emotes[:get_meaning][emoticons]
  else
    "Sorry, that emoticon was not found"
  end
end
