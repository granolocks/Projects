def alpha
  ('a'..'z').to_a
end

def generate_dictionary(key)
  new_alpha = alpha
  key.times { new_alpha.push(new_alpha.shift) }
  Hash[alpha.zip(new_alpha)]
end

def inverted_dictionary(key)
  Hash[ generate_dictionary(key).to_a.map{|e| e.reverse} ]
end

def encode(key, string)
  dict = generate_dictionary(key)
  convert_string(dict,string)
end

def decode(key, string)
  dict = inverted_dictionary(key)
  convert_string(dict,string)
end

def convert_string(dict, string)
  new_string = ""

  string.split('').each do |char|
    new_string << (dict.keys.include?(char) ? dict[char] : char)
  end

  new_string
end

# puts "input key (1-25)"
# key = gets.chomp.to_i
# unless (1..25).include? key
#   puts "invalid key"
#   exit
# end
#
# puts "input string"
# string = gets.chomp
#
# encoded_string =  encode(key,string)
# decoded_string =  decode(key,encoded_string)
#
# puts "Encoded string: #{encoded_string}"
# puts "Decoded string: #{decoded_string}"
# puts "Expected value?: #{decoded_string == string}"

# to meet the requirments
puts encode(2,"hi") == "jk"
puts encode(20,"hi") == "bc"

