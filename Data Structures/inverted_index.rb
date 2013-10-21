# Instead of doing lots of File.read
# I'm just going to use a hash with
# filename as key and contents as value
#
files = {}
files[:filename_0] = "the wheels on the bus go"
files[:filename_1] = "round and round"
files[:filename_2] = "round and round"
files[:filename_3] = "round and round"
files[:filename_4] = "the wheels on the bus go"
files[:filename_5] = "round and round"
files[:filename_6] = "all through the town"
files[:filename_7] = "granolocks is awesome"

def inverted_index_for(file_hash)
  file_hash.each_with_object(Hash.new([])) do |file, index|
    # file is an array like [:filename, 'string contents']
    parse_string_into(index,file[0],file[1])
  end
end

def parse_string_into(index,filename,contents)
  uniq_word_list(contents).each do |word|
    index[word] = select_index_value(index,filename,word)
  end
  index
end

def uniq_word_list(string)
  string.split(' ').uniq
end

def select_index_value(index,filename,word)
  (index[word] == []) ? [filename] : index[word].push(filename)
end

require 'json'
puts JSON.pretty_generate inverted_index_for(files)

# {
#   "the": [
#     "filename_0",
#     "filename_4",
#     "filename_6"
#   ],
#   "wheels": [
#     "filename_0",
#     "filename_4"
#   ],
#   "on": [
#     "filename_0",
#     "filename_4"
#   ],
#   "bus": [
#     "filename_0",
#     "filename_4"
#   ],
#   "go": [
#     "filename_0",
#     "filename_4"
#   ],
#   "round": [
#     "filename_1",
#     "filename_2",
#     "filename_3",
#     "filename_5"
#   ],
#   "and": [
#     "filename_1",
#     "filename_2",
#     "filename_3",
#     "filename_5"
#   ],
#   "all": [
#     "filename_6"
#   ],
#   "through": [
#     "filename_6"
#   ],
#   "town": [
#     "filename_6"
#   ],
#   "granolocks": [
#     "filename_7"
#   ],
#   "is": [
#     "filename_7"
#   ],
#   "awesome": [
#     "filename_7"
#   ]
# }
