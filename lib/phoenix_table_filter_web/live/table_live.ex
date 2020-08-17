defmodule PhoenixTableFilterWeb.TableLive do
  use PhoenixTableFilterWeb, :live_view

  alias PhoenixTableFilterWeb.Data

  def mount(_params, _session, socket) do
    data = Data.getData()
    socket = assign(socket, headers: List.first(data), devices: List.last(data))
    IO.inspect(socket)
    {:ok, socket}
  end

  # <%= @brightness %>%
  def render(assigns) do
    ~L"""
    <h1 style="width:200px; margin:0 auto;">Geräte</h1>

    <table style="width:100%; padding-top:50px;">

      <tr>
        <%= for header <- @headers do %>
          <th>
            <%= header.title %>
          </th>
        <% end %>
      </tr>
      <%= for device <- @devices do %>
      <tr>
          <td><%= device.name %></td>
          <td><%= device.type %></td>
          <td><%= device.description %></td>
          <td><%= device.location %></td>
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
