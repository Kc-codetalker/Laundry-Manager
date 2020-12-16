defmodule LaundryManagerWeb.KilogramLaundryTransactionControllerTest do
  use LaundryManagerWeb.ConnCase

  alias LaundryManager.Laundry
  alias LaundryManager.Laundry.KilogramLaundryTransaction

  @create_attrs %{
    checkInDate: "2010-04-17T14:00:00.000000Z",
    checkOutDate: "2010-04-17T14:00:00.000000Z",
    description: "some description",
    laundryTypeName: "some laundryTypeName",
    pricePerWeight: 120.5,
    userId: 42,
    weight: 120.5
  }
  @update_attrs %{
    checkInDate: "2011-05-18T15:01:01.000000Z",
    checkOutDate: "2011-05-18T15:01:01.000000Z",
    description: "some updated description",
    laundryTypeName: "some updated laundryTypeName",
    pricePerWeight: 456.7,
    userId: 43,
    weight: 456.7
  }
  @invalid_attrs %{checkInDate: nil, checkOutDate: nil, description: nil, laundryTypeName: nil, pricePerWeight: nil, userId: nil, weight: nil}

  def fixture(:kilogram_laundry_transaction) do
    {:ok, kilogram_laundry_transaction} = Laundry.create_kilogram_laundry_transaction(@create_attrs)
    kilogram_laundry_transaction
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all kilogram_laundry_transactions", %{conn: conn} do
      conn = get(conn, Routes.kilogram_laundry_transaction_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create kilogram_laundry_transaction" do
    test "renders kilogram_laundry_transaction when data is valid", %{conn: conn} do
      conn = post(conn, Routes.kilogram_laundry_transaction_path(conn, :create), kilogram_laundry_transaction: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.kilogram_laundry_transaction_path(conn, :show, id))

      assert %{
               "id" => id,
               "checkInDate" => "2010-04-17T14:00:00.000000Z",
               "checkOutDate" => "2010-04-17T14:00:00.000000Z",
               "description" => "some description",
               "laundryTypeName" => "some laundryTypeName",
               "pricePerWeight" => 120.5,
               "userId" => 42,
               "weight" => 120.5
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.kilogram_laundry_transaction_path(conn, :create), kilogram_laundry_transaction: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update kilogram_laundry_transaction" do
    setup [:create_kilogram_laundry_transaction]

    test "renders kilogram_laundry_transaction when data is valid", %{conn: conn, kilogram_laundry_transaction: %KilogramLaundryTransaction{id: id} = kilogram_laundry_transaction} do
      conn = put(conn, Routes.kilogram_laundry_transaction_path(conn, :update, kilogram_laundry_transaction), kilogram_laundry_transaction: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.kilogram_laundry_transaction_path(conn, :show, id))

      assert %{
               "id" => id,
               "checkInDate" => "2011-05-18T15:01:01.000000Z",
               "checkOutDate" => "2011-05-18T15:01:01.000000Z",
               "description" => "some updated description",
               "laundryTypeName" => "some updated laundryTypeName",
               "pricePerWeight" => 456.7,
               "userId" => 43,
               "weight" => 456.7
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, kilogram_laundry_transaction: kilogram_laundry_transaction} do
      conn = put(conn, Routes.kilogram_laundry_transaction_path(conn, :update, kilogram_laundry_transaction), kilogram_laundry_transaction: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete kilogram_laundry_transaction" do
    setup [:create_kilogram_laundry_transaction]

    test "deletes chosen kilogram_laundry_transaction", %{conn: conn, kilogram_laundry_transaction: kilogram_laundry_transaction} do
      conn = delete(conn, Routes.kilogram_laundry_transaction_path(conn, :delete, kilogram_laundry_transaction))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.kilogram_laundry_transaction_path(conn, :show, kilogram_laundry_transaction))
      end
    end
  end

  defp create_kilogram_laundry_transaction(_) do
    kilogram_laundry_transaction = fixture(:kilogram_laundry_transaction)
    %{kilogram_laundry_transaction: kilogram_laundry_transaction}
  end
end
