import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :playground_application, PlaygroundApplication.Repo,
  username: "postgres",
  password: "postgres",
  database: "playground_application_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :playground_application, PlaygroundApplicationWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "lk9w69gaM5W5zPKEoqIJW8oZKxgRdaUiC8o7P72IAcG3C9Ei7V6aq4uqBJEbobV6",
  server: false

# In test we don't send emails.
config :playground_application, PlaygroundApplication.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
