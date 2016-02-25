# method that has list of words and randomly selects one when player starts game
# prints drawing with dashes for letters matching chosen word, tracks tries
# take in user input - letter or word.
# See if user input is included in out word
# if it is correct, we print out screen a
# if not correct, print out screen b




class NewGame
	# method to start new game with randomly selected word
	def initialize(word)
		@word = word
    	@game_status = true
	end

	def user_guess
		while @game_status == true do
			puts "Guess a letter:"
			guess = gets.chomp
		end
	end

end



# method to randomly select a word
def select_word
	word_array = ["mountain", "elephant", "hotdogs", "notebooks", "bicycle", "scaffolding"]
	word = word_array.sample
end
word = select_word

game = NewGame.new(word)

game.user_guess

" ()
 (__)
(____)
(______)
(________)
(__________)
\/\/\/\/\/
\/\/\/\/
\/\/\/
 \/\/
  \/"
