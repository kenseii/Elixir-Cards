defmodule Cards do
  def create_deck do
    values = ["Ace","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten","Jack","Queen","King"]
    suits = ["Spades","Clubs","Hearts","Diamonds"]

    #List comprehention
    for suit <- suits, value <- values do
                "#{value} of #{suit}"
    end
  end
  # Method to shuffle the order of a list cards
  def shuffle(deck) do
    Enum.shuffle(deck)

  end
  # Method to check if a deck contains a certain card and return true/false
  def contains?(deck, card) do
    Enum.member?(deck, card)

  end

  # Method to pick a set of card(hand) given all cards and hand size
  # basically it splits the given cards in [hand,the rest], while the hand's length is is the hand size
  # Using pattern matching i only return the hand content without the remaining cards
  @spec deal(any(), integer()) :: {[any()], [any()]}
  def deal(deck,hand_size) do
    {hand,_remaining_cards} = Enum.split(deck,hand_size)
    hand
  end

  # Method to save the picked cards via deal, inside a file
  def save(deck,filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename,binary)
  end

  #Method to read a content of a file
  def reader(filepath) do
    # try to get the file
    # if the message starts with :ok, return the content of the file
    # otherwise if the message holds :error
    case File.read(filepath) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error,_reason} -> "That file does not exist"
    end
  end

  # function to create a deck,shuffle,deal(pick some cards)
  # because we need to recursively pass data in functions we use the pipe operator
  def hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
