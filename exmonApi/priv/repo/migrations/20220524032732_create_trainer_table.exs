defmodule ExmonApi.Repo.Migrations.CreateTrainerTable do
  use Ecto.Migration

  def change do
    create table(:trainers, primary_key: false) do #primary key sempre são inteiros, queremos uuid entao usa false
    add :id, :uuid, primary_key: true
    add :name, :string
    add :password_hash, :string
    timestamps() 
    end
  end
end
