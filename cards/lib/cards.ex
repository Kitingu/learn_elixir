defmodule Cards do

  def create_deck do
    ["ace", "king", "queen", "jack", "10", "9", "8", "7", "6", "5", "4", "3", "2"]
  end

  def shuffle_deck(deck) do
    Enum.shuffle(deck) # Enum is a module that has a function called shuffle
  end

  def shuffle_deck do
    deck = create_deck()
    shuffle_deck(deck)
  end

  def save_deck(deck) do
    File.write("deck.txt", deck)
  end
end
