defmodule ExmonApi.Trainer.Pokemon.Update  do
  alias ExmonApi.{Trainer.Pokemon, Repo}
  alias Ecto.UUID

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID format"}
      {:ok, _uuid} -> update(params) # cast sendo feito pode passar como string
    end
  end

  defp update(%{"id" => uuid} = params) do
    case Repo.get(Pokemon,uuid) do
      nil -> {:error, "Pokemon not found"}
      pokemon -> updatePokemon(pokemon, params)
    end
  end

  defp updatePokemon(pokemon, params) do
    pokemon
    |> Pokemon.updateChangeset(params)
    |> Repo.update()
  end

end
