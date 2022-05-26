defmodule ExmonApiWeb.TrainersPokemonControlller do
  use ExmonApiWeb, :controller

  action_fallback ExmonApiWeb.FallbackController

  def create(conn, params) do
    params
    |> ExmonApi.createTrainerPokemon()
    |> handleResponse(conn, "create.json", :created)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> ExmonApi.deleteTrainerPokemon()
    |> handleDelete(conn)
  end

  def show(conn, %{"id" => id}) do
    id
    |>ExmonApi.fetchTrainerPokemon()
    |>handleResponse(conn, "show.json", :ok)
  end

  def update(conn, params) do
    params
    |>ExmonApi.updateTrainerPokemon()
    |>handleResponse(conn, "update.json", :ok)
  end

  defp handleDelete({:ok, _pokemon}, conn) do
    conn
    |>put_status(:no_content)
    |>text("")
  end
  defp handleDelete({:error, _reason} = error, _conn), do: error

  defp handleResponse({:ok, pokemon}, conn, view, status) do
    conn
    |>put_status(status) #coloca status na conection
    |>render(view, pokemon: pokemon) #renderiza uma view apos receber a chamada
  end
  defp handleResponse({:error, _changeset} = error, __conn, _view, _status), do: error

end
