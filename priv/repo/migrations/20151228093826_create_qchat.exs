defmodule BuckcalcWeb.Repo.Migrations.CreateQchat do
  use Ecto.Migration

  def change do
  	create table(:qchat) do
  		add :qrouting_id, references(:qrouting)
  		add :sent_by, references(:users)
  		add :body, :json
      timestamps
    end  
  end
end
