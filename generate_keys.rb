def inv_mod(num, mod)
    res = nil
    (0..mod).each do |step|
      k = (step * mod) + 1
      return k / num if k % num == 0
     end
    res
  end

p = 1521289243
q = 1521289411
n = p * q
tot = (p-1)*(q-1)
e = 17
d = inv_mod(e, tot)

File.open("public_key.txt", 'w') {|f| f.write("#{e}\n#{n}")}
File.open("private_key.txt", 'w') {|f| f.write("#{d}\n#{n}")}

