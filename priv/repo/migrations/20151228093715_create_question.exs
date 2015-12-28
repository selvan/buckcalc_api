defmodule BuckcalcWeb.Repo.Migrations.CreateQuestion do
  use Ecto.Migration

  def change do
  	create table(:questions) do
  		add :question, :text, null: false
  		add :user_id, references(:users)
      timestamps
    end  		
  end
end
