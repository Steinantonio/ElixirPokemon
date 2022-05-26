defmodule ExmonApiWeb.FallbackController do
  use ExmonApiWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |>put_status(:bad_request)
    |>put_view(ExmonApiWeb.ErrorView) #mandando ele pegar a view de outro lugar 
    |>render("400.json", result: result)
  end
end
