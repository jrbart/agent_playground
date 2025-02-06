defmodule OrderTest do
  use ExUnit.Case
  doctest Order

  test "greets the world" do
    assert Order.hello() == :world
  end
end
