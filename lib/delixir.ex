defmodule Delixir do
  use Application

  @moduledoc """
  Documentation for `Delixir`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Delixir.hello()
      :world

  """

  def start(_, _) do
    children = [
      Delixir.Consumer
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
