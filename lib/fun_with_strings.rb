module FunWithStrings
  def palindrome?
	  str1 = self.strip
	  str1.gsub!(/\W+/,'')
	  str1.downcase!
	  str1 == str1.reverse
  end
  def count_words
	hash = Hash.new
	strs = self.downcase.split
	strs.each{ |word|
		word.gsub!(/\W+/,'')
		hash[word] ||= 0 unless word == ""
		hash[word] += 1 unless word == ""
	}
	hash
  end
  def anagram_groups
	hash = Hash.new
	anagram_groups = [[]]
	words = self.split
	words.each{ |word|
		anagram_groups
	}
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
