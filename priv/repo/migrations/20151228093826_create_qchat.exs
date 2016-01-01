defmodule BuckcalcWeb.Repo.Migrations.CreateQchat do
  use Ecto.Migration

  def change do
  	create table(:qchat) do
  		add :qrouting_id, references(:qroutings)
  		add :sent_by, references(:users)
  		add :body, :map
      timestamps
    end  
  end
end
