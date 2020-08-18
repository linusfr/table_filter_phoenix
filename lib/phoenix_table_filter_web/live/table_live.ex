defmodule PhoenixTableFilterWeb.TableLive do
  use PhoenixTableFilterWeb, :live_view

  alias PhoenixTableFilterWeb.Data

  @spec mount(any, any, Phoenix.LiveView.Socket.t()) :: {:ok, any}
  def mount(_params, _session, socket) do
    data = Data.getData()
    socket = assign(socket, headers: List.first(data), devices: List.last(data))
    IO.inspect(socket)
    {:ok, socket}
  end

  # <%= @brightness %>%
  def render(assigns) do
    ~L"""
    <h1 class="caption">Geräte</h1>

    <table>

    <div class="tableSearchContainer">
      <form>
        <input class="tableSearchInput" type="text" placeholder="..." name="search">
        <button class="tableSearchButton" type="submit">Filter</button>
      </form>
    </div>

    <tr>
      <%= for %{title: t} <- @headers do %>
        <th>
          <%= t %>
        </th>
      <% end %>
    </tr>

      <%= for %{name: n, type: t, description: d, location: l} <- @devices do %>
      <tr>
          <td><%= n %></td>
          <td><%= t %></td>
          <td><%= d %></td>
          <td><%= l %></td>
      </tr>
     <% end %>
    </table>
    """
  end

  # assign
  # def handle_event("on", _, socket) do
  #   socket = assign(socket, :brightness, 100)
  #   {:noreply, socket}
  # end

  # update
  # def handle_event("down", _, socket) do
  #   socket = update(socket, :brightness, &(&1 - 10))
  #   {:noreply, socket}
  # end
end
