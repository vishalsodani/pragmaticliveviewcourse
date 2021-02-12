defmodule LiveViewStudioWeb.LightLive do
  use LiveViewStudioWeb, :live_view
  # params and session not used so using _
  def mount(_params, _session, socket) do
    #assign function returns an updated socket
    socket = assign(socket, :brightness, 10) #assigning values to be associated with socket

    #what does a socket structure contains
    #IO.inspect(socket) #gives
    #Phoenix.LiveView.Socket<
  # assigns: %{brightness: 10, flash: %{}, live_action: nil},
  # changed: %{brightness: true},
  # endpoint: LiveViewStudioWeb.Endpoint,
  # id: "phx-FmLjwoTJnMkr-ABj",
  # parent_pid: nil,
  # root_pid: nil,
  # router: LiveViewStudioWeb.Router,
  # view: LiveViewStudioWeb.LightLive,

    {:ok, socket} #return a tupule
  end

  def render(assigns) do
    ~L"""
    <h1>Front Porch Light</h1>
    <%= @brightness %>
    """
  end
end
