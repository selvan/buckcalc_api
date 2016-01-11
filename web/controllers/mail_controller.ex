defmodule BuckcalcApi.MailController do
  use BuckcalcApi.Web, :controller
  
  def in_email(conn, _params) do
    IO.puts "+++++++++++++++++++++++++++"
    IO.inspect conn
    IO.puts "+++++++++++++++++++++++++++"
    IO.inspect _params
    IO.puts "---------------------------"
    conn
    |> send_resp(200, "")
  end
end
