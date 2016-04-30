require 'pry'

class WaysOfExpressionService
  def initialize(exp)
    @exp = exp
    @dp = { 'true' => {} , 'false' => {} }
  end

  def ways(result, s, e)
    key = s.to_s + '_' + e.to_s
    return @dp[result.to_s][key] if @dp[result.to_s][key] != nil
    if s == e
      if valid_end?(result, s, e)
        return 1
      else
        return 0
      end
    end

    c = 0

    ((s+1)..e).each do |i|
      c += recursive_count(result, s, e, i) if is_operation(i)
    end

    @dp[result.to_s][key] = c
    return c
  end

  def recursive_count(result, s, e, i)
    c = 0
    if result
      case @exp[i]
      when '&'
        c += ways(true, s, i -1) * ways(true, i + 1, e)
      when '|'
        c += ways(true, s, i -1) * ways(true, i + 1, e)
        c += ways(true, s, i -1) * ways(false, i + 1, e)
        c += ways(false, s, i -1) * ways(true, i + 1, e)
      when '^'
        c += ways(true, s, i -1) * ways(false, i + 1, e)
        c += ways(false, s, i -1) * ways(true, i + 1, e)
      end
    else
      case @exp[i]
      when '&'
        c += ways(true, s, i -1) * ways(false, i + 1, e)
        c += ways(false, s, i -1) * ways(true, i + 1, e)
        c += ways(false, s, i -1) * ways(false, i + 1, e)
      when '|'
        c += ways(false, s, i -1) * ways(false, i + 1, e)
      when '^'
        c += ways(true, s, i -1) * ways(false, i + 1, e)
        c += ways(false, s, i -1) * ways(false, i + 1, e)
      end
    end
    return c
  end

  def is_operation(i)
    @exp[i] == '&' || @exp[i] == '|' || @exp[i] == '^'
  end

  def valid_end?(result, s, e)
    fail if s != e

    return true if @exp[s] == '1' && result
    return true if @exp[s] == '0' && !result
    return false
  end
end

def do_test(exp, result)
  ways_of_expression_service = WaysOfExpressionService.new(exp)
  ways_of_expression_service.ways(result, 0, exp.size-1)
end

counter = 0

while str = STDIN.gets
  break if str.chomp == "exit"
  exp = str.chomp if counter == 0
  res = str.chomp if counter == 1
  counter += 1
end

if res == 'true'
  res = true
else
  res = false
end

puts do_test(exp, res)
