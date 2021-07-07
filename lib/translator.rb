#require "emoticons.yml"
require "yaml"

def load_library(path)
  lib = YAML.load_file(path)
  { 
    get_meaning: lib.reduce({}) do | memo, (key,value) | 
      memo[value[1]] = key
      memo 
    end,
    get_emoticon: lib.reduce({}) do | memo, (key,value) | 
      memo[value[0]] = value[1]
      memo 
    end
  } # Implicit return of hash
  end

def get_japanese_emoticon(path,icon)
  lib = load_library(path)[:get_emoticon]
  if lib.has_key?(icon)
    lib.fetch(icon) # Returns value
  else  # Key isn't in lib
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path,icon)
  lib = load_library(path)[:get_meaning]
  if lib.has_key?(icon)
    lib.fetch(icon)
  else
    "Sorry, that emoticon was not found"
  end
end