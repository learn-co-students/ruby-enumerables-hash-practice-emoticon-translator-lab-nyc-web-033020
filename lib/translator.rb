# require modules here
require 'yaml'

def load_library(path)
  library = { get_emoticon: {}, get_meaning: {}}
  YAML.load_file(path).each_with_object(library) do |(key, val), hash|
    hash[:get_emoticon][val[0]] = val[1]
    hash[:get_meaning][val[1]] = key
  end
end

# returns "☜(⌒▽⌒)☞" for emoticon = "O:)"
def get_japanese_emoticon(path, emoticon)
  pair = load_library(path)[:get_emoticon].map do |english, japanese|
  # pair = load_library(path).map do |word, (english, japanese)|
    if english == emoticon
      # return to be "mapped" to pair
      japanese
    end
  # remove nil values from loops that didnt map anything (i.e. failed if check)
  end.compact

  pair.first ? pair.first : "Sorry, that emoticon was not found"
end

# returns "angel" for emoticon = "☜(⌒▽⌒)☞"
def get_english_meaning(path, emoticon)
  pair = load_library(path)[:get_meaning].map do |japanese_emoticon, meaning|
    if japanese_emoticon == emoticon
      # return to be "mapped" to pair
      meaning
    end
  # remove nil values from loops that didnt map anything (i.e. failed if check)
  end.compact

  pair.first ? pair.first : "Sorry, that emoticon was not found"
end