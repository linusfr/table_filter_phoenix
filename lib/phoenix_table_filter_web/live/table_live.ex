defmodule PhoenixTableFilterWeb.TableLive do
  use PhoenixTableFilterWeb, :live_view

  alias PhoenixTableFilterWeb.Data

  def mount(_params, _session, socket) do
    data = Data.getData()

    socket = assign(socket, headers: List.first(data), items: List.last(data), filter_word: "")

    IO.inspect(socket)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1 class="caption">Items</h1>

    <table>

    <div class="tableSearchContainer">
      <form phx-submit="update_filter">
        <input class="tableSearchInput" type="text" name="filter" value="<%= @filter_word %>"
               autofocus autocomplete="off"
              />

        <button class="tableSearchButton" autofocus type="submit">filter</button>
      </form>
    </div>

    <tr>
      <%= for %{title: t} <- @headers do %>
        <th>
          <%= t %>
        </th>
      <% end %>
    </tr>

      <%= for item <- @items do %>
        <tr>
          <%= for %{field_name: field_name} <- @headers do %>
            <td>

              <%= Map.fetch(item, field_name)%>
              <br>
              <%= field_name %>
              <br>
              <%= item.name %>

            </td>
          <% end %>
        </tr>
     <% end %>
    </table>
    """
  end

  @spec handle_event(<<_::104>>, map, Phoenix.LiveView.Socket.t()) :: {:noreply, any}
  def handle_event("update_filter", %{"filter" => filter}, socket) do
    socket =
      assign(socket,
        filter_word: filter
      )

    IO.inspect(filter)

    {:noreply, socket}
  end
end
