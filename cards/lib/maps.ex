colors = %{
  red: "red",
  green: "green",
  blue: "blue"
}

#pattern matching
%{red: red, green: green, blue: blue} = colors
IO.puts(red)
# updating map values 1
colors = %{colors | red: "crimson"}

#updating map values 2
Map.put(colors, "green", "green")


#adding new key value pairs
Map.put(colors, "yellow", "yellow")

#removing key value pairs
Map.delete(colors, "green")

#accessing values
colors["blue"]
