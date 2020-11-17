defmodule Cards do

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
