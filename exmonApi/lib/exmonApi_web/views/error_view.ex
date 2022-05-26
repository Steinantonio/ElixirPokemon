defmodule ExmonApiWeb.ErrorView do
  use ExmonApiWeb, :view
  import Ecto.Changeset, only: [traverse_errors: 2]

  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end

  # esse render vem do fallback
  def render("400.json", %{result: %Ecto.Changeset{} = result}) do
    %{message: translateError(result)}
  end

  def render("400.json", %{result: message}) do
    %{message: message}
  end

  defp translateError(changeset) do
    traverse_errors(changeset, fn {msg, opts} ->
      Regex.replace(~r"%{(\w+)}", msg, fn _, key ->
        opts |> Keyword.get(String.to_existing_atom(key), key) |> to_string()
      end)
    end)
  end
end
