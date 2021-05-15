defmodule HassApi do
  use WebSockex

  require Logger

  def start_link(url, _state) do
    WebSockex.start_link(url, __MODULE__, :init)
  end

  def handle_frame({:text, enc}, state) do
    msg = Jason.decode!(enc)
    case msg["type"] do
      "auth_required" when state == :init ->
        {:reply,
         {:text,
          Jason.encode!(%{type: "auth",
                          token: Application.get_env(:home_assistant_ltd, HassApi)[:token]})
         },
         :auth}
      "auth_ok" when state == :auth ->
          Logger.info("Auth accepted")
          {:ok, :connected}
      "auth_invalid" when state == :auth ->
        Logger.error("Auth failed")
        {:close, :failed}
    end
  end
end
