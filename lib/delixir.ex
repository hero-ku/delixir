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

  def command_type_to_num(type) do
    case type do
      :user -> 8
      :string -> 3
    end
  end

  def convert_option(option) do
    %{name: name, description: description, type: type} = option

    %{
      name: name,
      description: description,
      type: command_type_to_num(type),
      required:
        case option.required do
          true -> true
          false -> false
          nil -> true
        end
    }
  end

  def option(name, description, type, required) do
    convert_option(%{name: name, description: description, type: type, required: required})
  end

  def command(name, description, options) do
    %{name: name, description: description, options: Enum.map(options, &convert_option/1)}
  end

  def start(_, _) do
    children = [
      Delixir.Consumer
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
