defmodule BuckcalcApi.SessionController do
  use BuckcalcApi.Web, :controller

  alias BuckcalcApi.User
  import Ecto.Query

    plug :scrub_params, "user" when action in [:sign_in]

  def new(conn, auth_params) do
    changeset = User.changeset(%User{}, auth_params)
    render conn, "new.html", changeset: changeset 
  end
  
  def sign_in(conn, %{"user" => auth_params}) do
    user = User.fetch_for_auth(auth_params)  
    case user do
        nil ->
            conn 
            |> put_flash(:error, "Auth invalid")
            |> new(auth_params)
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
    def unauthenticated(conn, _params) do
        conn 
        |> put_flash(:warn, "Signin to proceed further") 
        |> redirect to: session_path(conn, :new)
    end
end
