defmodule BuckcalcWeb.QuestionControllerTest do
  use BuckcalcWeb.ConnCase

  alias BuckcalcWeb.Question
  alias BuckcalcWeb.User
  alias BuckcalcWeb.QRouting
  import Ecto.Repo
  import Ecto.Query
  
  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end
  
  test "fetch questions with routings, for a user", %{conn: conn} do
    user = Repo.insert! %User{email: "testuser1@example.com"}
    analyst1 = Repo.insert! %User{email: "testanalyst1@example.com"}
    analyst2 = Repo.insert! %User{email: "testanalyst2@example.com"}
    
    Enum.map((1..20), fn(x) ->
        Repo.transaction fn ->
            q=Repo.insert! %Question{question: "#{x}", asked_by: user.id}
            Repo.insert! %QRouting{question_id: q.id, answered_by: analyst1.id}
        end  
    end)
    
    conn = get conn, question_path(conn, :index, user.id)
    assert json_response(conn, 200)["data"] == []
  end 


#   test "creates and renders resource when data is valid", %{conn: conn} do
#     conn = post conn, question_path(conn, :create, user_id: 1), question: @valid_attrs
#     assert json_response(conn, 201)["data"]["id"]
#     assert Repo.get_by(Question, @valid_attrs)
#   end

end
