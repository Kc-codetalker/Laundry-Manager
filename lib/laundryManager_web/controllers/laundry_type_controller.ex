defmodule LaundryManagerWeb.LaundryTypeController do
  use LaundryManagerWeb, :controller

  alias LaundryManager.Laundry
  alias LaundryManager.Laundry.LaundryType

  action_fallback LaundryManagerWeb.FallbackController

  def index(conn, _params) do
    laundry_types = Laundry.list_laundry_types()
    render(conn, "index.json", laundry_types: laundry_types)
  end

  def create(conn, %{"laundry_type" => laundry_type_params}) do
    with {:ok, %LaundryType{} = laundry_type} <- Laundry.create_laundry_type(laundry_type_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.laundry_type_path(conn, :show, laundry_type))
      |> render("show.json", laundry_type: laundry_type)
    end
  end

  def show(conn, %{"id" => id}) do
    laundry_type = Laundry.get_laundry_type!(id)
    render(conn, "show.json", laundry_type: laundry_type)
  end

  def update(conn, %{"id" => id, "laundry_type" => laundry_type_params}) do
    laundry_type = Laundry.get_laundry_type!(id)

    with {:ok, %LaundryType{} = laundry_type} <- Laundry.update_laundry_type(laundry_type, laundry_type_params) do
      render(conn, "show.json", laundry_type: laundry_type)
    end
  end

  def delete(conn, %{"id" => id}) do
    laundry_type = Laundry.get_laundry_type!(id)

    with {:ok, %LaundryType{}} <- Laundry.delete_laundry_type(laundry_type) do
      render(conn, "delete.json", laundry_type: laundry_type)
    end
  end
end
