#keyword lists

users = [name: "John", age: 30, hobbies: ["reading", "swimming"]]

# keyword lists are lists of tuples where the first element is an atom
#As the name implies, keyword lists are simply lists. In particular, they are lists consisting of 2-item tuples where the first element (the key) is an atom and the second element can be any value. Both representations are the same:

[{:name, "John"}, {:age, 30}, {:hobbies, ["reading", "swimming"]}] == [name: "John", age: 30, hobbies: ["reading", "swimming"]]


#you can read the value of a keyword list using the brackets syntax:

users[:name] # => "John"
users[:age] # => 30
users[:hobbies] # => ["reading", "swimming"]

# updating keyword lists

users = Keyword.update(users, :age, 0, &(&1 + 1)) # the &1 is a shorthand for fn x -> x end
users = Keyword.put(users, :name, "Jane")
users = Keyword.put_new(users, :name, "Jane")

#Keyword lists are important because they have three special characteristics:

    # Keys must be atoms.
    # Keys are ordered, as specified by the developer.
    # Keys can be given more than once.
