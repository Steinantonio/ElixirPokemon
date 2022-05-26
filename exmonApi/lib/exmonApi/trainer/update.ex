defmodule ExmonApi.Trainer.Update  do
  alias ExmonApi.{Trainer, Repo}
  alias Ecto.UUID

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID format"}
      {:ok, _uuid} -> update(params) # cast sendo feito pode passar como string
    end
  end

  defp update(%{"id" => uuid} = params) do
    case fetchTrainer(uuid) do
      nil -> {:error, "Trainer not found"}
      trainer -> updateTrainer(trainer, params)
    end
  end

  def fetchTrainer(uuid), do: Repo.get(Trainer,uuid)

  defp updateTrainer(trainer, params) do
    trainer
    |> Trainer.changeset(params)
    |> Repo.update()
  end

end
