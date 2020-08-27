# sieve of Eratosthenes

class Sieve
  attr_reader :list, :max
  MIN = 2
  
  def initialize(n)
    @max = n
    @list = create_hash
  end

  def create_hash
    (MIN..max).each_with_object({}) { |num, hsh| hsh[num] = nil }
  end

  def primes
    (MIN..max).each do |i|
      next if list[i] == :marked
      search_range(i).each { |j| list[j] = :marked if composite?(i, j) }
    end
    
    list.select { |_, value| value.nil? }.keys
  end

  def search_range(i)
    (first_unmarked(i+1)..last_unmarked)
  end

  def first_unmarked(i)
    i += 1 until list[i].nil?
    i
  end

  def last_unmarked
    max.downto(MIN) { |num| return num if list[num].nil? }
  end

  def composite?(i, j)
    list[j].nil? && (j % i == 0)
  end

end

Sieve.new(10).primes