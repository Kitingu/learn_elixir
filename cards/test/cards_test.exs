defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck creates 52 cards" do
    deck = Cards.create_deck()
    assert length(deck) == 52
  end

  test "shuffle_deck returns a shuffled deck" do
    deck = Cards.create_deck()
    assert deck != Cards.shuffle_deck(deck)
  end

  test "deal returns a hand and a new deck" do
    deck = Cards.create_deck()
    {hand, new_deck} = Cards.deal(deck, 5)
    assert length(hand) == 5
    assert length(new_deck) == 47
  end

  test "contains? returns true if the deck contains the card" do
    deck = Cards.create_deck()
    assert Cards.contains?(deck, "ace of hearts")
  end

  test "shuffle_deck using refute to check that the deck is not the same" do
    # refute is the opposite of assert
    deck = Cards.create_deck()
    refute deck == Cards.shuffle_deck(deck)
  end

end
