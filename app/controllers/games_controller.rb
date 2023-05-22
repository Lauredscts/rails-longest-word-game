require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    alphabet = ('a'..'z').to_a
    @letters = 10.times.map { alphabet.sample }.join
  end

  def run
    # build the grid
    @grid = generate_grid(10).join
    @start_time = Time.now
  end

    # grid from the param
    def letter_in_grid
      @answer.chars.sort.all? { |letter| @grid.include?(letter) }
    end
    # verify if the word in english
  def english_word(word)
      urlpath = "https://wagon-dictionary.herokuapp.com/#{word}"
      result = JSON.parse(URI.open(urlpath).read)
      return word ["found"]
  end

  def score
    # Retrieve all game data from form
    grid = params[:grid].split("")
    @attempt = params[:attempt]
    @start_time = Time.parse(params[:start_time])
    end_time = Time.now
      if !letter_in_grid
      @result = "Sorry, but #{@answer} can’t be built out of #{grid_letters}."
      elsif !english_word
      @result = "Sorry but #{@answer} does not seem to be an English word."
      elsif letter_in_grid && !english_word
      @result = "Sorry but #{@answer} does not seem to be an English word."
      else letter_in_grid && !english_word
      @result = "Congratulation! #{@answer} is a valid English word."
    end
end
end
