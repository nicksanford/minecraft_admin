defmodule MinecraftAdminTest do
  use ExUnit.Case
  doctest MinecraftAdmin

  test "greets the world" do
    assert MinecraftAdmin.hello() == :world
  end
end
