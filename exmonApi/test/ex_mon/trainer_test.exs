defmodule ExmonApi.TrainerTest do
  use ExmonApi.DataCase

  alias ExmonApi.Trainer

  describe "changeset/1" do
    test "When all params are valid, return valid changeset" do
      params = %{name: "rafael", password: "1234567"}

      response = Trainer.changeset(params)

      assert %Ecto.Changeset{
               changes: %{
                 name: "rafael",
                 password: "1234567"
               },
               errors: [],
               data: %ExmonApi.Trainer{},
               valid?: true
             } = response
    end

    test "When there are invalid params, returns invalid changeset" do
      params = %{password: "1234567"}

      response = Trainer.changeset(params)

      assert %Ecto.Changeset{
               changes: %{
                 password: "1234567"
               },
               data: %ExmonApi.Trainer{},
               valid?: false
             } = response

      assert errors_on(response) == %{name: ["can't be blank"]}
    end
  end

  describe "build/1" do
    test "When all params are valid, return valid trainer struct" do
      params = %{name: "rafael", password: "1234567"}

      response = Trainer.build(params)

      assert {:ok,
              %Trainer{
                name: "rafael",
                password: "1234567"
              }} = response
    end

    test "When there are invalid params, returns error" do
      params = %{password: "1234567"}

      {:error, response} = Trainer.build(params)

      assert %Ecto.Changeset{valid?: false} = response

      assert errors_on(response) == %{name: ["can't be blank"]}
    end
  end
end
