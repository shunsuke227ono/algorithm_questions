class AllPermutationsService
  def initialize(s)
    @s = s
    @permutations = [[]]
  end

  def get_all
    (0...@s.size).each do |s_i|
      new_permutations = []
      @permutations.each do |current_p|
        set_new_permutations(s_i, current_p).each { |n_p| new_permutations << n_p }
      end
      @permutations = new_permutations
    end
    @permutations
  end

  private

  def set_new_permutations(s_i, current_p)
    new_permutations = []
    (0..current_p.size).each do |p_i|
      new_permutation = current_p[0...p_i]
      new_permutation << @s[s_i]
      current_p[p_i..-1].each do |c_p|
        new_permutation << c_p
      end
      new_permutations << new_permutation
    end
    new_permutations
  end
end

class TestAllPermutation
  class << self
    def execute
      all_permutations_service = AllPermutationsService.new('abcd')
      p all_permutations_service.get_all
    end
  end
end


TestAllPermutation.execute
