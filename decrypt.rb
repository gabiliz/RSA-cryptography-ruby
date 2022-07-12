# frozen_string_literal: true

key_file_name = ARGV[0]
src_file_name = ARGV[1]
dst_file_name = ARGV[2]

text_chunk = TextChunk.new(File.read(dst_file_name))

err, key_file_reader = CryptoHelper.get_key_file_reader(key_file_name)
if err != nil
  puts "Erro abrindo arquivo de chaves: #{err}"
end

err, dst_file, dst_writer = CryptoHelper.get_key_file_writer(dst_file_name)
if err != nil
  puts "Erro abrindo arquivo de saída: #{err}"
end

modulus, key = CryptoHelper.get_key_from_file(key_file_reader)

original_encoded_text = ""
src_file_scanner = File.read(src_file_name)

for src_file_scanner.scan(/\w+/)  do
  line = src_file_scanner.to_s
  encodedchunk = line.to_s
  originalchunk = encoded_chunk.exp(encoded_chunk, key, modulus)

  base64_encoded_chunk = text_chunk.to_integer(original_chunk)

  original_encoded_text += base64_encoded_chunk
end

decrypted_text_bytes = Base64.decode64(original_encoded_text)
decrypted_text = decrypted_text_bytes.to_s

File.open(dst_writer, "w+") {|f| f.write(decrypted_text) }
if err != nil
  puts err
end

err = dst_writer.flush
if err != nil
  puts "Erro ao fazer flush do arquivo de destino."
end

err = dst_file.close
if err != nil
  puts "Erro ao fechar o arquivo de destino."
end
