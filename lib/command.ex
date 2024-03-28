defmodule Delixir.Command do
  def command_type_to_num(type) do
    case type do
      :user -> 8
      :string -> 3
    end
  end

  def message(content) do
    %{type: 4, data: %{content: content}}
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
    %{name: name, description: description, type: type, required: required}
  end

  def response_type_to_num(type) do
    case type do
      :message -> 4
    end
  end

  def convert_response(%{type: type, content: content} = response) do
    %{
      type: response_type_to_num(type),
      data: %{
        content: content,
        ephemeral: response.ephemeral
      }
    }
  end

  def command(name, description, options) do
    %{name: name, description: description, options: Enum.map(options, &convert_option/1)}
  end
end
