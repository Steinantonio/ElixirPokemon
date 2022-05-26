defmodule ExmonApi.Trainer.Pokemon.Get  do
  alias Ecto.UUID
  alias ExmonApi.{Trainer.Pokemon, Repo}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format"}
      {:ok, uuid} -> get(uuid)
    end
  end

  def get(uuid) do
    case Repo.get(Pokemon, uuid) do
      nil -> {:error, "pokemon not found"}
      pokemon -> {:ok, Repo.preload(pokemon, :trainer)}
    end
  end
end
