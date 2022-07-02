#!/usr/bin/env ruby

# DECRYPT

require 'openssl'
require 'base64'

file_path = ARGV[0]
private_key_file = 'private.pem';
password = 'teste'

encrypted_string = File.read(file_path)

private_key = OpenSSL::PKey::RSA.new(File.read(private_key_file),password)
string = private_key.private_decrypt(Base64.decode64(encrypted_string))

File.open("decrypt.txt", "w+") {|f| f.write(string) }
