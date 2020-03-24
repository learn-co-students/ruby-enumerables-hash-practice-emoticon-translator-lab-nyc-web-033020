require "yaml"
require "pry"

def load_library(file_path)
  library = YAML.load_file(file_path)
  result = {
      :get_meaning => { },
      :get_emoticon => { }
    }
 library.each do | key, value |
   result[:get_meaning][value[1]] = key
   result[:get_emoticon][value[0]] = value[1]
 end
   #binding.pry
result
end


def get_japanese_emoticon(file_path, emoticon)
  data = load_library(file_path)
  answer =  data[:get_emoticon][emoticon]
  if answer == "(￣ー￣)" || answer == "(＾ｖ＾)" || answer == "(Ｔ▽Ｔ)"
    return answer
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  data = load_library(file_path)
  answer = data[:get_meaning][emoticon]
  if answer == "sad" || answer == "grinning" || answer == "happy"
    return answer
  else
    return "Sorry, that emoticon was not found"
  end
end
