defmodule BuckcalcWeb.Repo.Migrations.CreateQchat do
  use Ecto.Migration

  def change do
  	create table(:qchat) do
  		add :question_id, references(:questions)
  		add :user_id, references(:users)
  		add :body, :json
      timestamps
    end  
  end
end
