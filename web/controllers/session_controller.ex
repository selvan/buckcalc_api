defmodule BuckcalcApi.SessionController do
  use BuckcalcApi.Web, :controller

  alias BuckcalcApi.User
  import Ecto.Query

  def new(conn, _params) do
    render conn, "index.html"
  end
  
  def sign_in(conn, %{"email" => email, "password" => password}) do
    user = User |> Repo.get_by(email: email, password_digest: password)
    
    case user do
        nil -> redirect conn, to: session_path(conn, :new, %{email: email, password: password})
        _ ->
            conn
            |> put_flash(:info, "Logged in.")
            |> Guardian.Plug.sign_in(user)
            |> redirect(to: user_path(conn, :index))
    end
  end
  
  def sign_out(conn, _params) do
    Guardian.Plug.sign_out(conn)
    |> put_flash(:info, "Logged out successfully.")
    |> redirect(to: "/")
  end
  
  # callback 
    def unauthenticated(conn, params) do
        redirect conn, to: user_path(conn, :sign_in, params)
    end
end
