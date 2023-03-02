sort = [4, 3, 78, 2, 0, 2]

def bubble_sort(numbers)
  size_repetition = (numbers.length - 1)

  loop do
    swapped = false
    (1..size_repetition).each do |i|
      if numbers[i - 1] > numbers[i]
        numbers[i - 1], numbers[i] = numbers[i], numbers[i - 1]
        swapped = true
      end
    end
    size_repetition -= 1
    break unless swapped
  end
  print numbers
end

bubble_sort(sort)
