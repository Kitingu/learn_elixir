defmodule Cards do

  def create_deck do
   values = ["ace", "king", "queen", "jack", "10", "9", "8", "7", "6", "5", "4", "3", "2"]
   suits = ["hearts", "diamonds", "spades", "clubs"]
   newList = for suit <- suits, value <- values, do: "#{value} of #{suit}" #for suit in suits, value in values, do: "#{value} of #{suit}"
  end

  def shuffle_deck(deck) do
    Enum.shuffle(deck) #shuffle returns a shuffled list
  end

  def contains?(deck, card) do # the ? is a convention to indicate that the function returns a boolean
    Enum.member?(deck, card) #member? returns true if the list contains the given element
  end

  def save_deck(deck) do
    File.write("deck.txt", deck)
  end
end
