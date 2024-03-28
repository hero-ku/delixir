defmodule Delixir.Repeat do
  def description, do: "Repeats a message back to the user."

  def options,
    do: [
      %{
        name: "message",
        type: :string
      }
    ]

  def command(_) do
    IO.puts("Command activated!")
  end
end
