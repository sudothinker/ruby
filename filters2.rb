def make_filter(predicate)
  lambda do |list|
    results = []
    list.each do |r|
      results << r if predicate.call(r)
    end
    results
  end
end

even_filter = make_filter(lambda{|x| x % 2 == 0})

p even_filter.call([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
# [2, 4, 6, 8, 10]
