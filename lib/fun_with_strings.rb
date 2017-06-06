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
	anagram = Proc.new {
		|first, second|

		a = Hash.new
		b = Hash.new
		first.each_char{|let|
			a[let] ||= 0
			a[let] += 1
		} unless first.nil?
		second.each_char{|let|
			b[let] ||= 0
			b[let] += 1
		} unless second.nil?
		a == b
	}
	
	hash = Hash.new
	anagram_groupings = [[]]
	words = self.downcase.split

	words.each{ |word|
		word.gsub!(/\W+/,'')
		found = false
		for i in 0...anagram_groupings.length
			if anagram.call(anagram_groupings[i][0], word)
				anagram_groupings[i] << word
				found = true
				break
			end
		end
		anagram_groupings << [word] unless found || word == ""


	}

	
	anagram_groupings
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
