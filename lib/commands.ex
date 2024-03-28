defmodule Delixir.Commands do
  alias Nostrum.Struct.Interaction
  import Delixir.Command

  def test_command(%Interaction{user: user}, [%{name: "test", value: value}]) do
    IO.puts(user)
    IO.puts(value)

    %{
      type: :message,
      content: value
    }
  end

  def repeat_command(interaction, options) do
    %{
      type: :message
    }
  end
end
