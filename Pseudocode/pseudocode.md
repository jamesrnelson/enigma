Enigma class

encrypt method - will take three arguments
  1. the message you want to encrypt, preferable saved to a variable
  2. randomly generated key **
  3. today's date **

decrypt method - will also take three arguments
  1. the message you want to UNscramble
  2. the decryption key **
  3. the date **

  ** the encryption/decryption key and the date are each just one half of the
  rotation per letter.

crack method - will take two arguments
  1. the unscrambled output (should probably look like nonsense)
  2. the date. (half of the key. repeated comparison of expected characters
    "..end.." to the date offset, should help us yield the key. We will need to
    scan the string for something where the same character repeats twice,
    followed by three different characters, followed by that same character two
    more times.)

**********  
Key Generator - It looks like it should be a class, based on the words in the
spec, "Create an instance of a key generator."

Figure out what, if anything, you’d need to pass in to the object

  1. It's going to have to output a random five-digit key.
  2. We need to be able to divide those 5 digits into 4 separate numbers
    a. 1st and 2nd digits
    b. 2nd and 3rd digits
    c. 3rd and 4th digits
    d. 4th and 5th digits

Start writing tests for the key generator object based on the specs above
Go through building the implementation
Use it from your runner to generate and output a valid key

**********


Needs to be able to run from the command line following a pattern where the
encrypt ruby file is called, then the txt file containing the message that needs
to encrypt, and creating a new file containing encrypted text.

It should also contain an output that says the name of the file made, along with
the randomly generated key and the date.

      $ruby ./lib/encrypt.rb message.txt encrypted.txt
      Created 'encrypted.txt' with the key 82648 and date 030415

For decryption the command line interaction pattern should look like this

      $ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 030415
      Created 'decrypted.txt' with the key 82648 and date 030415

For cracking, the command line interaction should look like this.

      $ ruby ./lib/crack.rb encrypted.txt cracked.txt 030415
      Created 'cracked.txt' with the cracked key 82648 and date 030415
