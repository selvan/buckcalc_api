defmodule BuckcalcApi.SessionControllerTest do
  use BuckcalcApi.ConnCase

  test "Signin in", %{conn: conn} do
    conn = post conn, session_path(conn, :login), %{"user" => %{"email" => "2", "password" => "3"}}
    IO.puts html_response(conn, 302)
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
