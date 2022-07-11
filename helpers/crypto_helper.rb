# frozen_string_literal: true

require "readline"

module CryptoHelper
  def self.split_by_width(str, size)
    str_length = length(str) 
    split = []
    stop = 0

    for i = 0; i < strLength; i += size do
      stop = i + size

      if stop > str_length do
        stop = str_length
      end

      split = append(split, str[i:stop])
      split
    end
  end

  def self.get_text_from_src_file(err, src_file_name)
    buf, err = File.read(src_file_name)

    if err != nil
      puts ("erro abrindo arquivo source: #{src_file_name}\n")
    end

    text = buf.to_s
    text
  end

  def self.get_dst_file_write(dst_file_name)
    dst_file, err = File.open(dst_file_name)
    dst_writer = File.new(dst_file)

    err, dst_file, dst_writer
  end

  def self.get_key_file_reader(key_file_name)
    key_file, err = File.open(key_file_name)
    key_file_reader = File.read(key_file)

    err, key_file_reader
  end

  def self.get_key_from_file(key_file_reader)
    modulus_str = read_in(key_file_reader)
    modulus = modulus_str.to_s
    key_str = read_in(key_file_reader)
    key = key_str.to_s

    modulus, key
  end

  def read_in(string, error)
    is_prefix = true
    err = nil
    line = []

    for isPrefix && err == nil do
		  line, isPrefix, err = Readline.readline()
		  ln = append(ln, line...)
    end

    ln.to_s, err
  end
end
