def is_upper?(string)
  !string.match(/[[:lower:]]/)
end

def is_lower?(string)
  !string.match(/[[:upper:]]/)
end

def letter?(string)
  string.match?(/[[:alpha:]]/)
end

def numeric?(number)
  number.match?(/[[:digit:]]/)
end

def caesar_cipher(string, code)
  phrase = string.bytes

  for i in 0..(phrase.length - 1) do

    if letter?(string[i])

      if is_lower?(string[i])
        phrase[i] = (((phrase[i] - 97) + code) % 26) + 97

      elsif is_upper?(string[i])
        phrase[i] = (((phrase[i] - 65) + code) % 26) + 65
      end
    end
  end

  print phrase.pack('c*')
end
phrase_for_crypt = gets.chomp
code_for_crypt = gets.to_i
caesar_cipher(phrase_for_crypt, code_for_crypt)
