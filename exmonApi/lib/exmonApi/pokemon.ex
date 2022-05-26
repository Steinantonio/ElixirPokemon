defmodule ExmonApi.Pokemon do

  @keys [:id, :name, :weight, :types]

  @enforce_keys @keys

  @derive Jason.Encoder
  defstruct @keys

  def build(%{"id" => id, "name" => name, "weight" => weight, "types" => types }) do
    %__MODULE__{
      id: id,
      name: name,
      weight: weight,
      types: parseTypes(types)
    }
  end

  def parseTypes(types), do: Enum.map(types, fn item -> item["type"]["name"] end)

end
