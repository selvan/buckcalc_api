ExUnit.start

Mix.Task.run "ecto.create", ~w(-r BuckcalcWeb.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r BuckcalcWeb.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(BuckcalcWeb.Repo)

