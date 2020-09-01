=begin
input: string (RNA) of triplets (codons)
output: amino acid
RULE: If a STOP codon is encountered, all subsequent codons after
      are ignored

AUG	                Methionine
UUU, UUC	          Phenylalanine
UUA, UUG	          Leucine
UCU, UCC, UCA, UCG	Serine
UAU, UAC	          Tyrosine
UGU, UGC	          Cysteine
UGG	                Tryptophan
UAA, UAG, UGA	      STOP

=end
require 'pry'

class InvalidCodonError < StandardError
end

class Translation
  AA = {
    "Methionine" => %w(AUG),  
    "Phenylalanine" => %w(UUU UUC),
    "Leucine" => %w(UUA UUG),
    "Serine" => %w(UCU UCC UCA UCG),
    "Tyrosine" => %w(UAU UAC),
    "Cysteine" => %w(UGU UGC),
    "Tryptophan" => %w(UGG),
    "STOP" => %w(UAA UAG UGA)
  }

  def self.of_codon(codon)
    AA.keys.find(-> {raise InvalidCodonError}) { |key| AA[key].include?(codon) }
  end

  def self.of_rna(rna)
    codons = rna.scan(/.../)
    aminos = []

    codons.map do |codon|
      aa = of_codon(codon)
      terminate?(aa) ? break : aminos << aa
    end
    
    aminos
  end

  def self.terminate?(aa)
    aa == "STOP"
  end
end
