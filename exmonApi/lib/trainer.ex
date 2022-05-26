defmodule ExmonApi.Trainer do
  use Ecto.Schema
  import Ecto.Changeset
  alias ExmonApi.Trainer.Pokemon

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "trainers" do
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true # campo virtual que so existe no schema e nao no BD
    has_many(:pokemon, Pokemon)
    timestamps()
  end

  def build(params) do # validar o insert no banco antes de inserir
    params
    |>changeset()
    |>apply_action(:insert) #qualquer action e possivel ser colocada para identificacao
  end

  @requiredParams [:name, :password]

  def changeset(params), do: changesetPipeline(%__MODULE__{}, params)
  def changeset(trainer, params), do: changesetPipeline(trainer, params)

  defp changesetPipeline(module_or_trainer, params) do
    module_or_trainer
    |>cast(params, @requiredParams)
    |>validate_required(@requiredParams) # passando name e passwd
    |>validate_length(:password, min: 6) #password hash como 3rd parametro
    |>encryptPasswd() # indiretamente recbe os 3 paraemetros acima
  end



#pattern match identifica a tag valid dentro do changeset, e seta a key dentro de changes como novo valor
# declara igual a novas changes invoca o ecto com a funcao change e passa o 3rd parametro.
  defp encryptPasswd(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Pbkdf2.add_hash(password))
  end

  defp encryptPasswd(changeset), do: changeset

end
