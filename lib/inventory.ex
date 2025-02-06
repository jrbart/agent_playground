defmodule Inventory do
  use Agent

  def start_link(_initial_state) do
    Agent.start_link(fn -> %{stock: %{"abc" => 5}, other: %{}} end, name: __MODULE__)
  end

  def check_stock(sku) do
    state = Agent.get(__MODULE__, & &1)
    IO.inspect(state)
    # state = %{stock: %{"abc" => 5}}
    quantity = get_in(state.stock[sku])
    {:ok, quantity || 0}
  end

  def add_stock(sku, quantity) do
    state = Agent.get(__MODULE__, & &1)
    current = get_in(state.stock[sku])
    state = Map.put(state, :stock, %{sku => quantity+current})
    IO.inspect(state)
    Agent.update(__MODULE__,fn _ -> state end)
    {:ok, quantity+current}
  end
end
