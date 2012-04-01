def populate_words
	DB[:entries].all.each{|word|
		puts word
		Word.add_word(word)
	}	
end
