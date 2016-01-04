defmodule BuckcalcWeb.QuestionController do
  use BuckcalcWeb.Web, :controller

  alias BuckcalcWeb.Question
  import Ecto.Query
  
  plug :scrub_params, "question" when action in [:create]

  def index(conn, %{"user_id" => user_id, "page_size" => page_size, "page_offset" => page_offset}) do    
    page_size = case Integer.parse(page_size) do
        :error -> 10
        {psize, _} -> psize
    end
    
    page_offset = case Integer.parse(page_offset) do
        :error -> 0
        {poffset, _} -> poffset
    end          
    record_offset = page_offset * page_size
    query = Question |> where([q], q.asked_by == ^user_id) |> preload([:analysts]) |> order_by([:inserted_at, :id]) |> limit(^page_size) |> offset(^record_offset)
    questions = query |> Repo.all
    render(conn, "questions.json", questions: questions)
  end
    
  def index(conn, %{"user_id" => user_id}) do
    index(conn, %{"user_id" => user_id, "page_size" => "10", "page_offset" => "0"})
  end
  
  def create(conn, %{"user_id" => user_id, "question" => question}) do
    changeset = Question.changeset(%Question{}, %{question: question, asked_by: user_id})

    case Repo.insert(changeset) do
      {:ok, question} ->
        conn
        |> put_status(:created)
        |> render("question.json", question: (question |> Repo.preload([:analysts])))
      {:error, changeset} ->
        
        conn
        |> put_status(:unprocessable_entity)
        |> render(BuckcalcWeb.ChangesetView, "error.json", changeset: changeset)
    end
  end

#   def show(conn, %{"id" => id}) do
#     question = Repo.get!(Question, id)
#     render(conn, "show.json", question: question)
#   end

#   def update(conn, %{"id" => id, "question" => question_params}) do
#     question = Repo.get!(Question, id)
#     changeset = Question.changeset(question, question_params)

#     case Repo.update(changeset) do
#       {:ok, question} ->
#         render(conn, "show.json", question: question)
#       {:error, changeset} ->
#         conn
#         |> put_status(:unprocessable_entity)
#         |> render(BuckcalcWeb.ChangesetView, "error.json", changeset: changeset)
#     end
#   end

#   def delete(conn, %{"id" => id}) do
#     question = Repo.get!(Question, id)

#     # Here we use delete! (with a bang) because we expect
#     # it to always work (and if it does not, it will raise).
#     Repo.delete!(question)

#     send_resp(conn, :no_content, "")
#   end
end
