#!/usr/bin/env ruby

# ENCRYPT

require 'openssl'
require 'base64'

puts 'Escreva algo:'
string = gets

public_key_file = 'public.pem';

public_key = OpenSSL::PKey::RSA.new(File.read(public_key_file))
encrypted_string = Base64.encode64(public_key.public_encrypt(string))

File.open("encrypt.txt", "w+") {|f| f.write(encrypted_string) }
