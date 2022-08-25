# ._______.___    .___  ____   ____.___ .______
# : .____/|   |   : __| \   \_/   /: __|: __   \
# | : _/\ |   |   | : |  \___ ___/ | : ||  \____|
# |   /  \|   |/\ |   |  /   _   \ |   ||   :  \
# |_.: __/|   /  \|   | /___/ \___\|   ||   |___\
#    :/   |______/|___|            |___||___|

# Licensed under CC BY-NC-SA 3.0
# See license.txt or https://creativecommons.org/licenses/by-nc-sa/3.0/

# Elixir is built on the Erlang VM (or Beam, if you prefer), and as such, is a functional language. Values are, without
# exception, immutable. There is pattern matching. It is not, however, typed. With that said, the pattern matching can
# occasionally result in code that is typed-ish.

# Elixir's REPL is called Interactive Elixir, or IEx, and can be accessed from the command line via `iex`. It has a few
# helper functions, most important `h`; running this function without parameters will give you some information about
# IEx, including about its other helper functions. Caling it with an argument will, when applicable, show you
# information about the provided parameter, which is to say its doc string.
# Speaking of which: https://hexdocs.pm/elixir/1.12/writing-documentation.html

# This is a single-line comment.

# Simple arithmetic and comparison operators are exactly how you'd expect.
# Most of the value types are also pretty predictable. One thing to note, however, is that the basic list type is a
# linked list, as is typical with functional languages. Atoms are what symbols are called, and they're also kind of
# similar in usage to Ruby's symbols, as far as names and stuff like that go. More later.

########################
### Pattern Matching ###
########################

# Assignment is not normal assignment; it is _always_ pattern matching. (Is there a simpler bind operator?)
# If applicable, these examples will have a brief description, in the preceding comment, of the variables that will be bound.

# Matches (and binds) a on the left side to 1 on the right. a=1
# P.S. this positioning of the comment is determined by the auto formatter. I don't love it, but hey, auto formatting.
a = 1

# Some more interesting patterns to match. a=1, b=2, c=3
[a, b, c] = [1, 2, 3]

# Values can be matched directly; neither of these bind anything, but they both match (useful in functions; more later)
1 = 1
[1, 2, 3] = [1, 2, 3]

# Head and tail: h=1, t=[2,3]
[h | t] = [1, 2, 3]

# Nesting is no problem. Plus, multiple elements can be matched at the head. Not at the tail. a=1, b=2, c=3, d=[4,5,6]
[a, [b, c] | d] = [1, [2, 3], 4, 5, 6]

# An element can be ignored either with a plain underscore, or an underscore-prefixed name, if helpful for clarity. a=1
[a, _, _c] = [1, 2, 3]

# The value of a variable can also be used in matching, with the "pin" operator: ^
a = 12
[1, ^a, 3] = [1, 12, 3]

###################
### Basic Types ###
###################

# Date and Time literals. The brackets can be replaced with one of a few options, but we'll get into that later with sigils.
~D[2022-01-01]
~T[05:15:00]
~T[16:30:45.876]

# RegEx literals. Elixir uses PCRE. There are a few modifier options, which you can see with `h Regex`.
~r/Chapter \d+/i

################
### Examples ###
################

defmodule Examples do
  @moduledoc """
  These are some miscellaneous examples, mostly stuff I wrote to try out something I just read about or as a solution to
  one of Programming Elixir's exercises. Or just to challenge myself I guess.
  """

  @doc """
  Appends m to the end of n.
  
  iex> Examples.append([1, 2, 3], [4, 5, 6])
  [1, 2, 3, 4, 5, 6]
  """
  def append(n, m)
  def append([n], m), do: [n | m]
  def append([n | nt], m), do: [n | append(nt, m)]
end
