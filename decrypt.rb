#!/usr/bin/env ruby

# DECRYPT

require 'openssl'
require 'base64'

private_key_file = 'private.pem';
password = 'teste'

encrypted_string = %Q{
mN9AP/782b61geqhINqGBvrP8HuzsD9f0JoV+L+OM6laZk+4luTYFqPyZlaX
3c/2z5mjNGwZC2XuC0RsbdMgNt/pVR3Tp3+50VlWCXK+LOTia+azFdX/pAQS
/pplvC79snKEb22AVPq49oMxUtWR30MZMwCWFyYI2iHqNEO3do/WJyaqrqNs
D3dtf/ZTYsWsG2Tn0jDyYe7B+gZyfAHFP7WuIG2Izk7DonwIobfhCsfnmZMJ
QIErO9Kx7oiVChrY79e2aSwPPtmnudSubhrs7D20G4qK/B+B79CL172XWaV2
lB78aUT7aCDMDEK5IOmXi7VbJVZBoeAsAjMicjem8w==
}

private_key = OpenSSL::PKey::RSA.new(File.read(private_key_file),password)
string = private_key.private_decrypt(Base64.decode64(encrypted_string))

puts string, "\n"