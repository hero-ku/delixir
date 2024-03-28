defmodule Delixir.Consumer do
  alias Nostrum.Struct.Interaction
  use Nostrum.Consumer
  import Delixir.Command

  @commands %{
    "repeat" => Delixir.Repeat
  }

  @app_id 1
  @guild_id 1

  def handle_event({:READY, _, _}) do
    Enum.each(@commands, fn cmd ->
      {name, module} = cmd
      options = convert_option(module.options())

      Nostrum.Api.create_guild_application_command(@app_id, @guild_id, %{
        name: name,
        description: module.description(),
        options: options
      })
    end)
  end

  def handle_event(
        {:INTERACTION_CREATE, %Interaction{data: %{name: name, options: options}} = interaction,
         _}
      ) do
    @commands[name].command(interaction, options)
  end
end
