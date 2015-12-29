defmodule BuckcalcWeb.Repo.Migrations.CreateQchat do
  use Ecto.Migration

  def change do
  	create table(:qchat) do
  		add :qrouter_id, references(:qrouter)
  		add :user_id, references(:users)
  		add :body, :json
      timestamps
    end  
  end
end
