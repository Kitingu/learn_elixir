defmodule Identicon do
  def main(input) do
    input
    |> to_hash  #calls next function passing in the result of the previous function
    |> pick_color #has the Identicon.Image struct as an argument
  end
  def pick_color(image) do
    %Identicon.Image{hex: hex_list} = image
    [r, g, b | _tail] = hex_list #pattern matching to get the first three elements of the list
    # | _tail is a convention to indicate that we don't care about the rest of the list
    [r, g, b]
  end
  def to_hash(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list
    %Identicon.Image{hex: hex}
  end





end
