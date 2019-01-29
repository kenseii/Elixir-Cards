defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  # This test ensures the deck generates/returns 52 cards
  test "create_deck makes 52 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 52
  end

  # Ensures that the shuffle methods really shuffles (I know its not 100% safe)
  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end
end
