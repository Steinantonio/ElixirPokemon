defmodule ExmonApi.Trainer.Create do
  alias ExmonApi.{Trainer,Repo}

  def call (params) do
    params
    |> Trainer.build()
    |> createTrainer
  end

    def createTrainer({:ok, struct}), do: Repo.insert(struct)
    def createTrainer({:error, __changeset} = error), do: error
    
end
