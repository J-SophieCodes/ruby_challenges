=begin
A circular buffer, cyclic buffer or ring buffer is a data structure 
that uses a single, fixed-size buffer as if it were connected 
end-to-end.

- A circular buffer first starts empty
- the oldest values inside the buffer are removed first
- When the buffer is full an error will be raised, alerting the client
  that further writes are blocked until a slot becomes free.
- the client can opt to overwrite the oldest data with a forced write. 

=end

class CircularBuffer
  def initialize(size)
    @size = size
    @buffer = []
  end

  def write(num)
    update_buffer(num) { raise BufferFullException }
  end

  def write!(num)
    update_buffer(num) { read }
  end

  def read
    raise BufferEmptyException if buffer.empty?
    buffer.shift
  end

  def clear
    buffer.clear
  end

  private

  attr_accessor :buffer
  attr_reader :size

  def update_buffer(num)
    return if num.nil?
    yield if full?
    buffer << num
  end

  def full?
    buffer.size == size
  end

  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end
end
