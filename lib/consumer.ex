defmodule Delixir.Consumer do
  use Nostrum.Consumer

  def handle_event({:READY, _, _}) do
    IO.puts("Bot ready!")

    # register slash commands
  end
end
