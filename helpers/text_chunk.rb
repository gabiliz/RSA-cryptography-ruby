# frozen_string_literal: true

class TextChunk
  def initialize(n)
    @string_val = ""

    case n
    when String
      @string_val = n
    when Numeric
      @string_val = numeric_to_string(n)
    end
  end

  def self.numeric_to_string(n)
    str_val = ""
    if n == 0
      str_val = "0"
    else
      while n > 0
        ans = n.divmod(256)
        char_num = ans[1]
        strVal += char_num.chr
        n = ans[0]
      end
    end
  
    return str_val
  end

  def self.to_string
    return @string_val
  end

  def self.to_integer
    result = 0

    @string_val.reverse.split('').each{|c|
      result = result * 256
      result += c.ord
    }

    return result
  end

  def self.block_size(n)
    block_size = 0
    temp = n - 1

    while temp > 1
      temp = temp / 2
      block_size += 1
    end

    return block_size / 8
  end
end
