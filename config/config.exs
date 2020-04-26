import Config

config :nostrum,
  token: System.fetch_env!("DISCORD_BOT_TOKEN"),
  num_shards: :auto

config :logger,
  level: :debug

config :logger, :console, metadata: [:shard]

config :minecraft_admin,
  guild_id: System.fetch_env!("DISCORD_GUILD_ID") |> String.to_integer(),
  channel_id: System.fetch_env!("DISCORD_CHANNEL_ID") |> String.to_integer()
