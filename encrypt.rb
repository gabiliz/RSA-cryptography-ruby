# frozen_string_literal: true

require './helpers/text_chunk'
require './helpers/crypto_helper'

key_file_name = ARGV[0]
src_file_name = ARGV[1]
dst_file_name = ARGV[2]

text_chunk = TextChunk.new(File.read("string.txt"))

err, key_file_reader = CryptoHelper.get_key_file_reader(key_file_name)
if err != nil
  puts "Erro abrindo arquivo de chaves: #{err}"
end

err, dst_file, dst_writer = CryptoHelper.get_dst_file_writer(dst_file_name)
if err != nil
  puts "Erro abrindo arquivo de saída: #{err}"
end

modulus, key = CryptoHelper.get_key_from_file(key_file_reader)

text = CryptoHelper.get_text_from_src_file(err, src_file_name)

chunk_size = text_chunk.block_size(modulus)
coded_text = Base64.encode64(text)

original_chunk = text_chunk.to_string(chunk)

encoded_chunk = original_chunk.Exp(original_chunk, key, modulus)

File.open(dst_writer, "w+") {|f| f.write(encoded_chunk) }

err = dst_writer.flush
if err != nil
  puts "Erro ao fazer flush do arquivo de destino."
end

err = dst_file.close
if err != nil
  puts "Erro ao fechar o arquivo de destino."
end
