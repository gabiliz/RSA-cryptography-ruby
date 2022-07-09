class TextChunk
  attr_accessor :string_val

  def initialize(n)
    @n = n
    @string_val = ""

    if @n.is_a? String
      @string_val = @n        
    else
      @string_val = int_to_str(n)
    end
  end

  def int_value
    result = 0        

    for c in reversed(@string_val)
      result = result * 256
      result += ord(c)
    end

    return result
  end

  private

  def int_to_str(n)
    if n == 0
      string_val = "0"    
    else
      string_val = ""        
  
      while n > 0
          quot, rem = divmod(n, 256)
          char_num = rem            
          string_val += chr(char_num)
          n = quot
      end
    end
  
    return string_val
  end
  
  def block_size(n)
    bsize = 0    
    temp = n - 1    
  
    while temp > 0
      temp /= 2        
      bsize += 1    
    end
  
    return int(bsize/8)
  end
end
