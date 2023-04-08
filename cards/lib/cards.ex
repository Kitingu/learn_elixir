defmodule Cards do

  def create_deck do
   values = ["ace", "king", "queen", "jack", "10", "9", "8", "7", "6", "5", "4", "3", "2"]
   suits = ["hearts", "diamonds", "spades", "clubs"]
   newList = for suit <- suits, value <- values, do: "#{value} of #{suit}" #for suit in suits, value in values, do: "#{value} of #{suit}"
  end

  def shuffle_deck(deck) do
    Enum.shuffle(deck) #shuffle returns a shuffled list
  end

  def deal(deck,hand_size) do
    #split returns a tuple two lists with the first list containing the first n elements of the list
    Enum.split(deck, hand_size) #split returns a tuple with two lists
    {hand, new_deck} = Enum.split(deck, hand_size) #pattern match the tuple with the two lists

  end

  def contains?(deck, card) do # the ? is a convention to indicate that the function returns a boolean
    Enum.member?(deck, card) #member? returns true if the list contains the given element
  end

  def save_deck(deck,filename) do
    binary = :erlang.term_to_binary(deck) #term_to_binary returns a binary representation of the given term
    File.write(filename, binary) #write writes the given binary to the given file
  end
end
