defmodule ExmonApi.Trainer.Pokemon.Delete  do
  alias Ecto.UUID
  alias ExmonApi.{Trainer.Pokemon, Repo}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format"}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(uuid) do
    case fetchPokemon(uuid) do
      nil -> {:error, "pokemon not found"}
      pokemon -> {:ok, Repo.delete(pokemon)}
    end
  end

  def fetchPokemon(uuid), do: Repo.get(Pokemon,uuid)

end
