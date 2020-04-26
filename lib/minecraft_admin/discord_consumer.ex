defmodule MinecraftAdmin.DiscordConsumer do
  @moduledoc false
  use Nostrum.Consumer
  alias Nostrum.Api
  alias Nostrum.Struct.Message

  require Logger

  @help """
  supported commands:
  ---------------------------------------------

  `!bot help` - prints (this) help message

  `!bot server status` - prints the server status

  `!bot server start` - starts the server

  `!bot server stop` - stops the server
  """

  def start_link(), do: Consumer.start_link(__MODULE__)

  @impl true
  def handle_event(
        {:MESSAGE_CREATE,
         msg = %Message{
           id: _msg_id,
           content: msg_content,
           channel_id: msg_channel_id,
           guild_id: msg_guild_id
         }, _wss}
      ) do
    guild_id = Application.fetch_env!(:minecraft_admin, :guild_id)
    channel_id = Application.fetch_env!(:minecraft_admin, :channel_id)

    with {^guild_id, ^channel_id, "!bot" <> bot_msg} <-
           {msg_guild_id, msg_channel_id, msg_content} do
      bot_msg
      |> String.trim()
      |> handle_command(msg)
    end
  end

  @impl true
  def handle_event({event_name, a, b}) do
    Logger.debug(fn ->
      "NICK: User would handle #{event_name} here, a: #{inspect(a)}, b: #{inspect(b)}"
    end)
  end

  def handle_command("help" <> _rest_of_msg, msg = %Message{}) do
    Api.create_message(msg, content: @help)
  end

  def handle_command("server status", msg = %Message{}) do
    Api.create_message(msg, content: "NOT IMPLEMENTED")
  end

  def handle_command("server start", msg = %Message{}) do
    Api.create_message(msg, content: "NOT IMPLEMENTED")
  end

  def handle_command("server stop", msg = %Message{}) do
    Api.create_message(msg, content: "NOT IMPLEMENTED")
  end

  def handle_command(_command, msg = %Message{}) do
    Api.create_message(msg,
      content:
        "Sorry but that is not a supported command, type `!bot help` to see a list of supported commands"
    )
  end
end
