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
    	@letter_array = []
	end

	def user_guess
		while @game_status == true do
			draw_icecream
      draw_guesses
			puts "Guess a letter:"
			guess = gets.chomp
		end
	end

	def draw_icecream
		# array of ascii art representing icecream cone, line removed when player guesses wrong
		icecream = ["     ()", "    (__)", "   (____)", "  (______)", " (________)", "(__________)", " X X X X X", "  X X X X ", "   X X X ", "    X X ", "     X"]
		puts icecream
	end


  def draw_guesses
    while @letter_array.length <= @word.length
    # split word and put letters in array
      @word.split("").each do |letter|
    	@letter_array.push(letter)
      end
    end
    # draws blank spaces or correct guesses under ice cream
    word_length = @letter_array.length
    puts "__ " * word_length
    puts @letter_array.length
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

# game.draw_guesses
