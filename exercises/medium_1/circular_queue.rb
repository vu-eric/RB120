class CircularQueue
  attr_reader :size, :index_queue, :queue
  def initialize(size)
    @size = size
    @index_queue = []
    @queue = Array.new(size)
  end

  def enqueue(num)
    index = index_queue.empty? ? 0 : (index_queue.last + 1) % size
    index_queue.shift if index_queue.length == size 
    index_queue << index
    queue[index] = num
  end

  def dequeue
    index = index_queue.shift
    return nil unless index 
    old_num, queue[index] = queue[index]
    old_num
  end
end
queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
