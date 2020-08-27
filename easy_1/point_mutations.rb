=begin
Write a program that can calculate the Hamming distance between 
two DNA strands.

Hamming distance = the minimum number of point mutations
- compute the Hamming distance over the shorter length
=end

class DNA
  attr_reader :aa

  def initialize(sequence)
    @sequence = sequence
    @aa = @sequence.chars
  end

  def hamming_distance(another_seq)
    dna2 = DNA.new(another_seq)
    aa.zip(dna2.aa).select(&:all?).count do |aa1, aa2|
      aa1 != aa2
    end
  end
end