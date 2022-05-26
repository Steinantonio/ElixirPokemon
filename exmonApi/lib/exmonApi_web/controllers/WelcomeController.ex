defmodule ExmonApiWeb.WelcomeController do
  # definindo o arquivo como controller
  use ExmonApiWeb, :controller

  # underlineVariable serve para ignorar a variavel
  def index(conn, _params) do
    text(conn, "WelcomeBruh")
    #linguagem funcional sempre retornar a connection, pois não é um objeto.
  end
end
