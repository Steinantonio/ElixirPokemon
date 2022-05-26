defmodule ExmonApi.Trainer.Pokemon.Create do
  alias ExmonApi.Pokemon
  alias ExmonApi.Trainer.Pokemon, as: TrainerPokemon
  alias ExmonApi.Pokemon.Client
  alias ExmonApi.Repo


  def call(%{"name" => name} = params) do
    name
    |>Client.getPokemon()
    |>handleResponse(params)
  end

  defp handleResponse({:ok, body}, params) do
    body
    |>Pokemon.build()
    |>createPokemon(params)
  end

  defp handleResponse({:error, __msg} = error, _params), do: error

  defp createPokemon(%Pokemon{name: name, weight: weight, types: types},
  %{"nickname" => nickname,
  "trainer_id" => trainer_id
  }) do
    params = %{
      name: name,
      weight: weight,
      types: types,
      nickname: nickname,
      trainer_id: trainer_id
    }

    params
    |>TrainerPokemon.build()
    |>handleBuild()
  end

  defp handleBuild({:ok, pokemon}), do: Repo.insert(pokemon)
  defp handleBuild({:error, __changeset} = error), do: error



end
