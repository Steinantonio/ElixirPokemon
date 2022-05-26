defmodule ExmonApi.Pokemon.Get do

  alias ExmonApi.Pokemon.Client
  alias ExmonApi.Pokemon

  def call(name) do
    name
    |>Client.getPokemon()
    |>handleResponse()
  end

  defp handleResponse({:ok, body}), do: {:ok, Pokemon.build(body)}
  defp handleResponse({:error,  _reason} = error), do: error

end
