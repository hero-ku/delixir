defmodule Delixir.Consumer do
  use Nostrum.Consumer

  @commands %{
    "repeat" => Delixir.Repeat
  }

  def handle_event({:READY, _, _}) do
    Enum.each(@commands, fn cmd ->
      IO.puts(cmd)
    end)
  end
end
