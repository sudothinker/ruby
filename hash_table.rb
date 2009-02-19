class HashTable
  def initialize
    @hash = []
  end
  
  def put(key, value)
    @hash[hash(key)] = value
  end
  
  def get(key)
    @hash[hash(key)]
  end
  
private
  def hash(key)
    key.hash % 1024
  end
end

h = HashTable.new
h.put("michael", "michael")
puts h.get("michael")

h.put("john", "john")
puts h.get("john")

h.put("jim", "jim")
puts h.get("jim")

puts h.get("michael")