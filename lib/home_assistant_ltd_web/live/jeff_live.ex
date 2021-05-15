defmodule HomeAssistantLtdWeb.JeffLive do
  use HomeAssistantLtdWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, [garage: :unknown, front_door: :unknown])}
  end

  def render(assigns) do
    ~L"""
    <h1>Garage  Door</h1>
    <%= @garage %>
    <h1>Front Door</h1>
    <%= @front_door %>
    """
  end
end
