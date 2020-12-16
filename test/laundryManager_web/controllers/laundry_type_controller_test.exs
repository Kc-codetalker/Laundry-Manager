defmodule LaundryManagerWeb.LaundryTypeControllerTest do
  use LaundryManagerWeb.ConnCase

  alias LaundryManager.Laundry
  alias LaundryManager.Laundry.LaundryType

  @create_attrs %{
    isKilogram: true,
    isUnit: true,
    name: "some name"
  }
  @update_attrs %{
    isKilogram: false,
    isUnit: false,
    name: "some updated name"
  }
  @invalid_attrs %{isKilogram: nil, isUnit: nil, name: nil}

  def fixture(:laundry_type) do
    {:ok, laundry_type} = Laundry.create_laundry_type(@create_attrs)
    laundry_type
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all laundry_types", %{conn: conn} do
      conn = get(conn, Routes.laundry_type_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create laundry_type" do
    test "renders laundry_type when data is valid", %{conn: conn} do
      conn = post(conn, Routes.laundry_type_path(conn, :create), laundry_type: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.laundry_type_path(conn, :show, id))

      assert %{
               "id" => id,
               "isKilogram" => true,
               "isUnit" => true,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.laundry_type_path(conn, :create), laundry_type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update laundry_type" do
    setup [:create_laundry_type]

    test "renders laundry_type when data is valid", %{conn: conn, laundry_type: %LaundryType{id: id} = laundry_type} do
      conn = put(conn, Routes.laundry_type_path(conn, :update, laundry_type), laundry_type: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.laundry_type_path(conn, :show, id))

      assert %{
               "id" => id,
               "isKilogram" => false,
               "isUnit" => false,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, laundry_type: laundry_type} do
      conn = put(conn, Routes.laundry_type_path(conn, :update, laundry_type), laundry_type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete laundry_type" do
    setup [:create_laundry_type]

    test "deletes chosen laundry_type", %{conn: conn, laundry_type: laundry_type} do
      conn = delete(conn, Routes.laundry_type_path(conn, :delete, laundry_type))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.laundry_type_path(conn, :show, laundry_type))
      end
    end
  end

  defp create_laundry_type(_) do
    laundry_type = fixture(:laundry_type)
    %{laundry_type: laundry_type}
  end
end
