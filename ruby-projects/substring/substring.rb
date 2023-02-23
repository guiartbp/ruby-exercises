dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substring(search, dictionary)
    words = search.gsub(/[^a-z\s]/i, '').downcase.split

    my_hash = Hash.new

    words.each do |word|   
        size_of_word = word.length - 1

        for i in 0..size_of_word
            for j in 0..size_of_word
                # puts "i: #{i} j: #{j}"         
                check = word[i..j]

                if dictionary.include?(check)
                    if my_hash[check] 
                        my_hash[check] += 1
                    else
                        my_hash[check] = 1
                    end
                end
            end
        end
    end
    print my_hash
end

substring("Howdy partner, sit down! How's it going?", dictionary)

