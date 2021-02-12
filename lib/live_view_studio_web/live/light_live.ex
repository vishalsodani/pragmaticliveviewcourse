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

  #this assigns is a map which is part of the socket structure we saw with IO.inspect
  def render(assigns) do
    ~L"""
    <h1>Front Porch Light</h1>
    <div id="light">
      <div class="meter">
        <span style="width: <%= @brightness %>%">
          <%= @brightness %>
        </span>
      </div>
      <button phx-click="off">
        <img src="images/light-off.svg"/>
      </button>
      <button phx-click="up">
        <img src="images/up.svg"/>
      </button>
      <button phx-click="down">
        <img src="images/down.svg"/>
      </button>
      <button phx-click="on">
        <img src="images/light-on.svg"/>
      </button>

      <button phx-click="random">
        <img src="images/random.svg"/>
      </button>
    </div>

    """
  end

  def handle_event("off", _, socket) do
    socket = assign(socket, :brightness, 0)
    {:noreply, socket}
  end

  def handle_event("on", _, socket) do
    socket = assign(socket, :brightness, 100)
    {:noreply, socket}
  end

  def handle_event("up", _, socket) do
    socket = update(socket, :brightness, &min(&1 + 10, 100))
    {:noreply, socket}
  end

  def handle_event("down", _, socket) do
    socket = update(socket, :brightness, &max(&1 - 10, 0))
    {:noreply, socket}
  end

  def handle_event("random", _, socket) do
    socket = assign(socket, :brightness, Enum.random(0..100))
    {:noreply, socket}
  end

end
