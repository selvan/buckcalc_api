defmodule BuckcalcWeb.QuestionView do
  use BuckcalcWeb.Web, :view

  def render("questions.json", %{questions: questions}) do
    %{data: render_many(questions, BuckcalcWeb.QuestionView, "questions.json")}
  end
  
end
