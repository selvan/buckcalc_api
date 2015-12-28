defmodule BuckcalcWeb.PageController do
  use BuckcalcWeb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
