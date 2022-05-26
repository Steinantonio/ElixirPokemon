defmodule ExmonApiWeb.TrainersController do
  use ExmonApiWeb, :controller
  alias ExmonApiWeb.Auth.Guardian

  action_fallback ExmonApiWeb.FallbackController

  def create(conn, params) do
    with  {:ok, trainer} <- ExmonApi.createTrainer(params),
    {:ok, token, _claims} <- Guardian.encode_and_sign(trainer) do
      conn
      |>put_status(:created)
      |>render("create.json", %{trainer: trainer, token: token})
    end
  end

  def delete(conn, %{"id" => id}) do
    id
    |> ExmonApi.deleteTrainer()
    |> handleDelete(conn)
  end

  def show(conn, %{"id" => id}) do
    id
    |>ExmonApi.fetchTrainer()
    |>handleResponse(conn, "show.json", :ok)
  end

  def update(conn, params) do
    params
    |> ExmonApi.updateTrainer()
    |> handleResponse(conn, "update.json", :ok)
  end

  defp handleDelete({:ok, _trainer}, conn) do
    conn
    |>put_status(:no_content)
    |>text("")
  end
  defp handleDelete({:error, _reason} = error, _conn), do: error



  defp handleResponse({:ok, trainer}, conn, view, status) do
    conn
    |>put_status(status) #coloca status na conection
    |>render(view, trainer: trainer) #renderiza uma view apos receber a chamada
  end
  defp handleResponse({:error, _changeset} = error, __conn, _view, _status), do: error

end
