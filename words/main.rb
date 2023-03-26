def top_words(text)
  words = text.downcase.gsub(/[^a-z']+/i, ' ').split

  words = words.map { |w| w.sub(/^'/, '').sub(/'$/, '') }

  frequency = Hash.new(0)
  words.each { |w| frequency[w] += 1 }

  valid_words = frequency.select do |word, count|
    word.length > 2 && count > 1
  end

  if valid_words.length < 3
    return valid_words.keys.take(3)
  end

  valid_words.keys.sort_by { |w| -frequency[w] }.take(3)
end

text = "In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income."

puts top_words(text).inspect