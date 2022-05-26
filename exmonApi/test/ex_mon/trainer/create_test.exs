defmodule ExmonApi.Trainer.CreateTest do
  use ExmonApi.DataCase

  alias ExmonApi.{Repo, Trainer}
  alias Trainer.Create

  describe "call/1"  do
    test "when all params are valid, creates a trainer" do
      params = %{name: "rafael", password: "1234567"}

      count_before = Repo.aggregate(Trainer, :count)

      response = Create.call(params)

      count_after = Repo.aggregate(Trainer, :count)

      assert{:ok, %Trainer{name: "rafael"}} = response
      assert count_after > count_before
    end
  end

  test "when there are invaid params, returns error" do
    params = %{name: "rafael"}

    response = Create.call(params)

    assert{:error, changeset} = response
    assert errors_on(changeset) == %{password: ["can't be blank"]}
  end
end
