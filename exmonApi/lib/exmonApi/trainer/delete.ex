defmodule ExmonApi.Trainer.Delete  do
  alias Ecto.UUID
  alias ExmonApi.{Trainer, Repo}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format"}
      {:ok, uuid} -> delete(uuid)
    end
  end

  def delete(uuid) do
    case fetchTrainer(uuid) do
      nil -> {:error, "Trainer not found"}
      trainer -> {:ok, Repo.delete(trainer)}
    end
  end

  def fetchTrainer(uuid), do: Repo.get(Trainer,uuid)

end
