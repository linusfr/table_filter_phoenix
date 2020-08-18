defmodule PhoenixTableFilterWeb.Data do
  alias PhoenixTableFilterWeb.Device
  alias PhoenixTableFilterWeb.TableHeader

  headers = [
    %TableHeader{field_name: "name", sortable: true, title: "Gerätename"},
    %TableHeader{field_name: "type", sortable: true, title: "Gerätetyp"},
    %TableHeader{field_name: "description", sortable: true, title: "Gerätebeschreibung"},
    %TableHeader{field_name: "location", sortable: true, title: "Adresse"}
  ]

  def foo(a) when a in 1..3 do
    :ok
  end

  def foo(_a), do: :error

  devices = [
    %Device{
      name: "TestName1",
      type: "DeviceType1",
      description: "very descriptive description",
      location: "some address"
    },
    %Device{
      name: "TestName2",
      type: "DeviceType1",
      description: "very descriptive description",
      location: "some address"
    },
    %Device{
      name: "TestName3",
      type: "DeviceType2",
      description: "very descriptive description",
      location: "some address"
    }
  ]

  @data [headers, devices]

  def getData() do
    @data
  end
end
