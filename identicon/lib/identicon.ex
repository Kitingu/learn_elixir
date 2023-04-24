defmodule Identicon do
  def main(input) do
    input
    |> to_hash  #calls next function passing in the result of the previous function
    |> pick_color #has the Identicon.Image struct as an argument
    |> build_grid
  end
  @doc """
  Takes an Identicon.Image struct and returns an updated struct with a color tuple

  """
  def pick_color(%Identicon.Image{hex: [r,g,b | _tail]} = image) do
    #shorthand for pattern matching
   # %Identicon.Image{hex: [r,g,b | _tail]} = image
    %Identicon.Image{image | color: {r,g,b}} #update the image struct with the color tuple

  end
  def build_grid(%Identicon.Image{hex: hex} = image) do
    grid = hex #grid is assigned the value of the result of chaining the next functions
    |> Enum.chunk_every(3,3, :discard) #chunk_by returns a list of lists with the given number of elements
    |> Enum.map(&mirror_row/1) #map returns a list with the result of the given function applied to each element
    #the & is a shorthand for fn x -> x which is a function that returns its argument
    |> List.flatten
    |> Enum.with_index()
    %Identicon.Image{image | grid: grid}  #update the image struct with the grid
  end

  def mirror_row(row) do
    [first,second | _tail] = row
    row ++ [second,first]

  end

  def to_hash(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list
    %Identicon.Image{hex: hex}
  end





end
