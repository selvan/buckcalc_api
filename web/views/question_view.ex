defmodule BuckcalcWeb.QuestionView do
  use BuckcalcWeb.Web, :view

  def render("questions.json", %{questions: questions}) do
    %{data: render_many(questions, BuckcalcWeb.QuestionView, "question.json")}
  end
    
  def render("question.json", %{question: question}) do
    %{
        question: question.question,
        analysts: Enum.map(question.analysts, fn(a) -> %{email: a.email} end)
    }
  end   
end
