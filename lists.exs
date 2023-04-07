names =  ["John", "Jane", "Joe", "Jill"]

# to get the first element
firstname = names |> Enum.at(0)
IO.puts firstname <> " is the first name"

# to get the last element
lastname = names |> Enum.at(-1)
IO.puts lastname <> " is the last name"
