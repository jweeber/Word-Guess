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
    	@dashes_array = []
			@incorrect_guesses = 0
			@icecream = ["     ()", "    (__)", "   (____)", "  (______)", " (________)", "(__________)", " X X X X X", "  X X X X ", "   X X X ", "    X X ", "     X"]
	end

	def user_guess
		while @game_status == true do
					draw_icecream
      		draw_guesses
			puts "\nGuess a letter:"
			guess = gets.chomp
			guess_include(guess)
			puts @word
		end
	end

	def guess_include(guess)
		if @letter_array.include?(guess)
			puts "It's a match!"
			guess_index = @letter_array.index(guess)
			@dashes_array[guess_index] = guess
			@dashes_array.each do |dash|
    			print dash
    		end
		else
			puts "Not a match"
			@incorrect_guesses += 1
			@icecream.shift
				if @incorrect_guesses == 6
					puts "No more guesses! You lose."
					exit
				end
		end
		draw_icecream
		draw_guesses
	end

	def draw_icecream
		# array of ascii art representing icecream cone, line removed when player guesses wrong
		puts @icecream
	end


  def draw_guesses
  	puts @word.length
  	# split word and put letters in array
    until @letter_array.length == @word.length
      	@word.split("").each do |letter|
    	@letter_array.push(letter)
      end
    	word_length = @letter_array.length
    	word_length.times do
    		@dashes_array.push("__ ")
    	end
    	@dashes_array.each do |dash|
    		print dash
    	end
    	#puts @dashes_array
    end
    # draws blank spaces or correct guesses under ice cream

    #puts @letter_array
    #puts @letter_array.length
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
