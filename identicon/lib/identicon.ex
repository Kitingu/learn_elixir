defmodule Identicon do
  def main(input) do
    input
    |> to_hash  #calls next function passing in the result of the previous function
  end
  def to_hash(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list
    %Identicon.Image{hex: hex}
  end





end
