defmodule BuckcalcApi.Repo.Migrations.CreateQuestion do
  use Ecto.Migration

  def change do
  	create table(:questions) do
  		add :question, :text, null: false
  		add :asked_by, references(:users), null: false
      timestamps
    end

    create index(:questions, [:inserted_at])  		
  end
end
