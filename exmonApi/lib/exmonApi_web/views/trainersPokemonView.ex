defmodule ExmonApiWeb.TrainersPokemonControlllerView do
  use ExmonApiWeb, :view
  alias ExmonApi.Trainer.Pokemon

  def render("create.json", %{pokemon: %Pokemon{
    id: id,
    name: name,
    inserted_at: inserted_at,
    nickname: nickname,
    types: types,
    trainer_id: trainer_id,
    weight: weight
    }}) do
    %{
      message: "Pokemon Created",
      pokemon: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        nickname: nickname,
        types: types,
        weight: weight,
        trainer_id: trainer_id
      }
    }
  end

  def render("show.json", %{pokemon: %Pokemon{
    id: id,
    name: name,
    inserted_at: inserted_at,
    nickname: nickname,
    types: types,
    weight: weight,
    trainer: %{id: trainer_id, name: trainer_name}
    }}) do
    %{
      pokemon: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        nickname: nickname,
        types: types,
        weight: weight,
        trainer: %{id: trainer_id, name: trainer_name}
      }
    }
  end

  def render("update.json", %{pokemon: %Pokemon{
    id: id,
    name: name,
    inserted_at: inserted_at,
    nickname: nickname,
    types: types,
    trainer_id: trainer_id,
    weight: weight
    }}) do
    %{
      message: "Pokemon Updated",
      pokemon: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        nickname: nickname,
        types: types,
        weight: weight,
        trainer_id: trainer_id
      }
    }
  end
end
