defmodule ExmonApiWeb.Controllers.TrainersControllerTest do
  use ExmonApiWeb.ConnCase

  describe "create/2" do

     test "when try to create trainer with correct params", %{conn: conn} do
      params = %{name: "TesterLester", password: "1234567"}

      conn
      |>post(Routes.trainers_path(conn, :create, params))
      |>json_response(201)

      assert response = %{
        "message" => "Trainer Created",
        "trainer" => %{
          "name" => "TesterLester"
        }
      }
     end
  end
end
