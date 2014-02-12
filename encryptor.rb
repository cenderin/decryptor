class Encryptor 
	def initialize(default_rotation = 20)
		@rotation = default_rotation
	end

	def cipher
			k = ('a'..'z').to_a 
			v = k.to_a.rotate(@rotation)
			zipped = k.zip(v)
			Hash[zipped]	
	end

	def decipher
			k = ('a'..'z').to_a.reverse
			v = k.to_a.rotate(-@rotation)
			zipped = k.zip(v)
			Hash[zipped]	
	end

	def encrypt_letter(letter)
		cipher[letter.downcase]
	end

	def encrypt_letter_decrypt(letter)
		decipher[letter.downcase]
	end

	def encrypt(string)
    letters = string.split("")
    letters.collect { |letter| encrypt_letter(letter) }.join
  end

  def decrypt(string)
    letters = string.split("")
    letters.collect { |letter| encrypt_letter_decrypt(letter) }.join.capitalize
  end
end


# require './encryptor'
# read_file = File.open('secret.txt')
# word = read_file.read
# read_file.close

# e = Encryptor.new(20)
# encrypted_word = e.decrypt(word)

# write_file = File.open('secret.txt', 'w+')
# write_file.write(encrypted_word)
# write_file.close