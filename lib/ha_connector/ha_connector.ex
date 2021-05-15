defmodule HaConnector do
  use GenServer

  #Client
  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{})
  end

  def get(ha, entity) do
    GenServer.call(ha, {:get, entity})
  end

  def update(ha, entity, data) do
    GenServer.cast(ha, {entity, data})
  end

  #Server
  def init(data) do
    {:ok, data}
  end

  def handle_cast({k, v}, data) do
    {:noreply, Map.put(data, k, v)}
  end

  def handle_call({:get, k}, _from, data) do
    {:reply, Map.get(data, k), data}
  end
end
