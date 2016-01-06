defmodule BuckcalcApi.PageController do
  use BuckcalcApi.Web, :controller
  
  plug Guardian.Plug.EnsureAuthenticated, handler: BuckcalcApi.SessionController

  def index(conn, _params) do
    render conn, "index.html"
  end
end
