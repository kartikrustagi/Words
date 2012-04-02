class Word < Sequel::Model(:words)

	Word.unrestrict_primary_key

	def before_create
		self.word.downcase!
		self.added_at = Time.now
	end

	def self.add_word(word)
		count = Word.count
		prev_word = Word.filter(:id => count).first
		word[:prev] = count
		word[:id] = (count+1)
		Word.create(word)
		prev_word.update(:next => (count+1)) unless prev_word.nil?
		return word[:id]
	end

	def validate
		super
		errors.add(:word, "cant be empty") if word.empty? or word.nil?
	end

end
