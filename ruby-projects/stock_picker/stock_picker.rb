prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]

def stock_picker(prices)
  c = 0
  adress = []
  prices.each_with_index do |num, idx|
    for i in 0..(prices.length - 1)
      if i == idx
        puts i
      elsif i < idx
        if num - prices[i] > c
          c = num - prices[i]
          adress = [i, idx]
        end
      end
    end
  end
  print adress
end

stock_picker(prices)
