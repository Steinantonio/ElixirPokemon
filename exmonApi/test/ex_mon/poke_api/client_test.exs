defmodule ExmonApi.PokeApi.ClientTest do
  use ExUnit.Case
  import Tesla.Mock

  alias ExmonApi.Pokemon.Client

  @basicUrl "https://pokeapi.co/api/v2/pokemon"

  describe "getPokemon/1" do
    test "when there is a pokemon with the given name returns the pokemon" do
      body = %{"name" => "pikachu,", "weight" => 60, "types" => ["electric"]}

      mock(fn %{method: :get, url: @basicUrl <> "/pikachu"} ->
        %Tesla.Env{status: 200, body: body}
      end)

      response = Client.getPokemon("pikachu")

      expected_response =
        {:ok,
         %{
           "name" => "pikachu,",
           "types" => ["electric"],
           "weight" => 60
         }}

      assert response == expected_response
    end

    test "when there is no pokemon with the given name returns error" do
      mock(fn %{method: :get, url: @basicUrl <> "/pikaku"} ->
        %Tesla.Env{status: 404}
      end)

      response = Client.getPokemon("pikaku")

      expected_response = {:error, "Pokemon not found"}

      assert response == expected_response
    end

    test "when there is an unexpected error returns the error" do
      mock(fn %{method: :get, url: @basicUrl <> "/pikachu"} ->
        {:error, :timeout}
      end)

      response = Client.getPokemon("pikachu")

      expected_response = {:error, :timeout}

      assert response == expected_response
    end
  end
end
