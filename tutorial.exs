# tuple
result = {:ok,"success"}
case result do
   {:ok,result} -> " this matchs"
   {:error,result} -> " this won't match"
   _ -> "This matches against anything else "
end
# condition
color = "blue"
cond do
  color == "blue" -> color
  color == "red" -> color
  color == "green" -> color
  color == "black" -> color
end

error = {:error,"error"}
with  {:ok,result}<- result do
  result
end

with  {:ok , _result}<- result do
  {:error,_result} <- error do
    "This gets executed"
  end
end

sum = fn a,b -> a+b  end
# Modules organize name and private function into a namespace.
defmodule Math do
  def sum(a,b) do
    a+b
  end
end
Math.sum(1,2)
defmodule Greet do
  def hello(name) do
    greeting(name)
  end
  defp greeting(name) do
    "Hello" <> " " <> name
  end
end
Greet.hello("Ratchanon")
# module attribute
defmodule Greeting do
  @name "Ratchanon" #constant
  def hello(), do: "Hello #{@name}"
  def morning(), do: "Good morning #{@name}"
  def night(), do: "Good night #{@name}"
end
Greeting.hello()
# Struct is special map to defined set of keys and default values
defmodule User do
  defstruct [:name, :age]
end
u = %User{age: 20}
u.age
# Used to alias modules name when we need to use them within other modules
defmodule Display do
  def math(result) do
    "Your result is #{result}"
  end
end

defmodule Math do
  alias Display

  def sum(a,b) do
    a+b
  end

  def dusplay_result() do
    result = sum(1,2)
    Display.math(result)

  end
end
# import
defmodule Import do
  import Math
  def inport_sum(a,b) do
    sum(a,b)
  end
end
Import.inport_sum(1,2)
# function arguements
defmodule Say do
  def hello() , do: "Hello!" # hello/1
  def hello(name), do: hello() <> " " <> name #hello/2
  def hello(name,lastname) do "Hello #{name} #{lastname}" end
  def hello(greeting, name, last_name) do
    "#{greeting}! #{name} #{lastname}"
  end
end
Say.hello( )

defmodule Say do
  def hello(name,last_name,greeting \\ "Hello!") do
    "#{greeting}! #{name} #{last_name}"
  end
end
Say.hello("Ratchanon","Traitiprat") # --> the result is Hello!! Ratchanon Traitiprat

# Function pattern matching --> codd working from top to buttom
defmodule Alphabet do
  def letter(:a), do: "a"
  def letter(:b), do: "b"
  def letter(:c), do: "c"
  def letter(letter), do: "letter"
end
Alphabet.letter(:b ) # it will be reture b

#function condition
defmodule Alphabet do
  def letter(letter) when letter == :a do
    "a"
  end
  def letter(letter) when letter == :b do
    "b"
  end
  def letter(letter) when letter == :c do
    "c"
  end

end
