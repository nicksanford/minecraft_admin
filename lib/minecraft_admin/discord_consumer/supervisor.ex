defmodule MinecraftAdmin.DiscordConsumer.Supervisor do
  use Supervisor
  alias MinecraftAdmin.DiscordConsumer

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  @impl true
  def init(:ok) do
    children = [DiscordConsumer]
    Supervisor.init(children, strategy: :one_for_one)
  end
end
