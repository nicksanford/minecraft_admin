import Config

config :logger,
  level: :debug

config :logger, :console, metadata: [:shard]
