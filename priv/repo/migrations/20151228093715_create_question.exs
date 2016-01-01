defmodule BuckcalcWeb.Repo.Migrations.CreateQuestion do
  use Ecto.Migration

  def change do
  	create table(:questions) do
  		add :question, :json, null: false
  		add :asked_by, references(:users), null: false
      timestamps
    end  		
  end
end
