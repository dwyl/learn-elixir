defmodule Animals do
  @moduledoc """
  Documentation for Animals.
  """

  @doc """
  create_zoo returns a list of animals you would find in a zoo

  ## Examples

      iex> Animals.create_zoo
      ["lion", "tiger", "gorilla", "elephant", "monkey", "giraffe"]

  """
  def create_zoo do
    ["lion", "tiger", "gorilla", "elephant", "monkey", "giraffe"]
  end

  @doc """
  randomise takes a list of zoo animals and returns a new randomised list with
  the same elements as the first.

  ## Examples

      iex> zoo = Animals.create_zoo
      iex> Animals.randomise(zoo)
      ["monkey", "tiger", "elephant", "gorilla", "giraffe", "lion"]
  """
  def randomise(zoo) do
    Enum.shuffle(zoo)
  end

  @doc """
  contains? takes a list of zoo animals and a single animal and returns a boolean
  as to whether or not the list contains the given animal.

  ## Examples

      iex> zoo = Animals.create_zoo
      iex> Animals.contains?(zoo, "gorilla")
      true
  """
  def contains?(zoo, animal) do
    Enum.member?(zoo, animal)
  end



    @doc """
    remaining takes a list of zoo animals and the number of animals that
    have already been viewed and returns a list of animals that you have left
    to see

    ## Examples

        iex> zoo = Animals.create_zoo
        iex> Animals.remaining(zoo, 2)
        ["gorilla", "elephant", "monkey", "giraffe"]
    """
    def remaining(zoo, count) do
      # Enum.split returns a tuple so we have to pattern match on the result
      # to get the value we want out
      {_seen, to_see} = Enum.split(zoo, count)
      to_see
    end
end
