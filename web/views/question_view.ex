defmodule BuckcalcApi.QuestionView do
  use BuckcalcApi.Web, :view

  def render("questions.json", %{questions: questions}) do
    %{data: render_many(questions, BuckcalcApi.QuestionView, "question.json")}
  end
    
  def render("question.json", %{question: question}) do
    %{
        question: question.question,
        analysts: Enum.map(question.analysts, fn(a) -> %{email: a.email} end)
    }
  end   
end
