defmodule BuckcalcWeb.QuestionView do
  use BuckcalcWeb.Web, :view

  def render("index.json", %{questions: questions}) do
    %{data: render_many(questions, BuckcalcWeb.QuestionView, "question.json")}
  end

  def render("show.json", %{question: question}) do
    %{data: render_one(question, BuckcalcWeb.QuestionView, "question.json")}
  end

  def render("question.json", %{question: question}) do
    %{id: question.id}
  end
end
