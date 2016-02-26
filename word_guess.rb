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
		user_guess
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
	
		# if one or more occurances of guess is in word or guess is whole word
		if @letter_array.include?(guess) || guess == @word
			puts "It's a match!"

			# if the guess is the whole word, win and exit
			if guess == @word
				puts "You win! Enjoy your ice cream!"
				puts @word
				exit
			end

			# if there is only one occurance of guess in letters_array
			if @letter_array.count(guess) == 1
					guess_index = @letter_array.index(guess)
					@dashes_array[guess_index] = guess

			# iterate through letters and if letter == guess, replace correct dash with guess		
			else
				temp_index = []
				@letter_array.each_with_index { |letter, index| temp_index << index if @letter_array[index] == guess }

				#puts temp_index

				temp_index.each do |index|
					#guess_index = @letter_array[index]
					@dashes_array[index] = guess
				end
			end		

			# if the updated dash array is the whole word, win, exit
			if @dashes_array == @letter_array
				puts "You win! Enjoy your ice cream!"
				puts @word
				exit
			end
			# reprompt the user for another letter
			user_guess
		end

		# if the letter is not in the array, lose round
		if @letter_array.include?(guess) == false
			puts "Not a match"
			@incorrect_guesses += 1
			@icecream.shift
				if @incorrect_guesses == 6
					puts "No more guesses! You lose."
					exit
				end
			user_guess
		end
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
    	#puts @dashes_array
    end
		@dashes_array.each do |dash|
			print dash
		end
    # draws blank spaces or correct guesses under ice cream

    #puts @letter_array
    #puts @letter_array.length
  end


end



# method to randomly select a word
def select_word
	word_array = ["dog", "mountain", "elephant", "hotdogs", "notebooks", "bicycle", "scaffolding"]
	word = word_array.sample
end

word = select_word
game = NewGame.new(word)
# game.user_guess
