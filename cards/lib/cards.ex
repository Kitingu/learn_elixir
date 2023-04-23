defmodule Cards do
  @moduledoc """
  This module contains functions for creating and manipulating a deck of cards
  """

  @doc """
  create_deck a list of strings representing a deck of cards
  """
  def create_deck do
   values = ["ace", "king", "queen", "jack", "10", "9", "8", "7", "6", "5", "4", "3", "2"]
   suits = ["hearts", "diamonds", "spades", "clubs"]
   newList = for suit <- suits, value <- values, do: "#{value} of #{suit}" #for suit in suits, value in values, do: "#{value} of #{suit}"
  end

  @doc """
  shuffle_deck a list of strings representing a deck of cards
  """
  def shuffle_deck(deck) do
    Enum.shuffle(deck) #shuffle returns a shuffled list
  end

  @doc """
  divide a deck into a hand and a new deck
  the `hand_size` is the number of cards that should be in the hand

  ## Examples
      iex> deck = Cards.create_deck()
      iex> {hand, new_deck} = Cards.deal(deck, 5)
      iex> hand
      ["ace of hearts", "king of hearts", "queen of hearts", "jack of hearts", "10 of hearts"]

  """
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

  @doc """
  load binary file into a variable
  return
  """
  def load(filename) do
    #File.read(filename) #read reads the given file and returns a tuple with the status and the binary
    # returns {:ok, binary} or {:error, error}
    # so we can pattern match the tuple and get the binary or the error
    case File.read(filename) do
      {:ok, binary } -> :erlang.binary_to_term(binary)  #binary_to_term returns the term represented by the given binary
      {:error, _error}  -> "The file does not exist"
    end
  end
  def create_hand(hand_size) do

    Cards.create_deck()
    |> Cards.shuffle_deck()  # pipe operator passes the
    |> Cards.deal(hand_size)
  end
end
