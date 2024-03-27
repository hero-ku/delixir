defmodule DelixirTest do
  use ExUnit.Case
  doctest Delixir

  test "greets the world" do
    assert Delixir.hello() == :world
  end
end
