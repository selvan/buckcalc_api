defmodule BuckcalcApi.MailControllerTest do
  use BuckcalcApi.ConnCase

  test "in_email", %{conn: conn} do
    conn = post conn, mail_path(conn, :in_email), %{"from": "x@example.com"}
    assert response(conn, 200) =~ ""
  end
end
