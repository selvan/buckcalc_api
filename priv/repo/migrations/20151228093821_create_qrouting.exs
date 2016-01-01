defmodule BuckcalcWeb.Repo.Migrations.CreateQrouter do
  use Ecto.Migration

  def change do
  	create table(:qroutings) do
  		add :question_id, references(:questions)
  		add :answered_by, references(:users) 
      timestamps
    end  
  end
end
