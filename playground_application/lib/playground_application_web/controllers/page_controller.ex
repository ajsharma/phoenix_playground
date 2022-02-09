defmodule PlaygroundApplicationWeb.PageController do
  use PlaygroundApplicationWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
