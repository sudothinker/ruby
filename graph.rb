class Graph
  def initialize(nodes=[], edges=[])
    @nodes = nodes
    @edges = edges
  end
  
  def add_node(node)
    @nodes << node
  end
  
  def find_node(data)
    @nodes.select{ |n| n.data == data }.first
  end
  
  def add_edge(edge)
    @edges << edge
  end
  
  def breadth_first(from, to)
    queue = [from]
    visited = []
        
    while !queue.empty?
      node = queue.pop
      next if visited.include?(node)
      return true if node == to
      visited << node
      queue.push(find_adjacent(node))
      queue.flatten!
      queue.uniq!
      puts queue.inspect
    end
    return false
  end
  
  def find_adjacent(node)
    edges = @edges.select{ |e| e.from == node || e.to == node}
    edges.map{ |e| e.from == node ? e.to : e.from}
  end
  
  def to_s
    puts @nodes.inspect
    puts @edges.inspect
  end
end

class Node
  def initialize(data=nil)
    @data = data
  end
  
  def data
    @data
  end
end

class Edge
  def initialize(from, to)
    @from = from
    @to = to
  end
  
  def from
    @from
  end
  
  def to
    @to
  end
end
  
g = Graph.new
[1, 2, 3, 4, 5, 6].each do |n|
  g.add_node(Node.new(n))
end

[[1, 2], [1, 5], [2, 3], [3, 4], [4, 5], [4, 6], [2, 5]].each do |e|
  g.add_edge(Edge.new(g.find_node(e.first), g.find_node(e.last)))
end

puts g.breadth_first(g.find_node(1), g.find_node(4))