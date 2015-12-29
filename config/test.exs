use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :buckcalc_web, BuckcalcWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :buckcalc_web, BuckcalcWeb.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "buckcalc_web_test",
  hostname: "192.168.99.100",
  pool: Ecto.Adapters.SQL.Sandbox
