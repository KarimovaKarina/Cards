defmodule Cards do
  @moduledoc """
   Provides methods for creating and handling a deck of cards
  """

  @doc """
   Returns a list of strings representing deck of playing cards 
  """
  def create_deck do
    values = ["Ace","Two","Three", "Four", "Five"]
    suits = ["Spade", "Club", "Heart", "Diamond"]

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end  
        
  end  

  def shuffle(deck) do
    Enum.shuffle(deck)
  end  

  def contain?(deck, card) do
    Enum.member?(deck, card)
  end 

  @doc """
   Divides a deck into a hand and the remainder of the deck.
   The 'hand_size' argument indicates how many cards should be at the hand 

  ## Examples

      iex(1)> deck = Cards.create_deck
      iex(2)> {hand, deck} = Cards.deal(deck, 1)
      iex(3)> hand
      ["Ace of Spade"]
      
  """
  def deal(deck, hands_size) do
    Enum.split(deck, hands_size)
  end  

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end  

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end  
  end
  
  def create_hand(hand_size) do
    #deck = Cards.create_deck
    #deck = Cards.shuffle(deck)
    #hand = Cards.deal(deck, hand_size)

    Cards.create_deck 
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end  

end
