defmodule BuckcalcApi.PageControllerTest do
  use BuckcalcApi.ConnCase

  test "GET /", %{conn: conn} do
    conn = post conn, question_path(conn, :create, user.id), @valid_attrs
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
