defmodule LaundryManagerWeb.UnitLaundryTransactionControllerTest do
  use LaundryManagerWeb.ConnCase

  alias LaundryManager.Laundry
  alias LaundryManager.Laundry.UnitLaundryTransaction

  @create_attrs %{
    checkInDate: "2010-04-17T14:00:00.000000Z",
    checkOutDate: "2010-04-17T14:00:00.000000Z",
    description: "some description",
    laundryTypeName: "some laundryTypeName",
    numPieces: 42,
    pricePerPiece: 120.5,
    userId: 42
  }
  @update_attrs %{
    checkInDate: "2011-05-18T15:01:01.000000Z",
    checkOutDate: "2011-05-18T15:01:01.000000Z",
    description: "some updated description",
    laundryTypeName: "some updated laundryTypeName",
    numPieces: 43,
    pricePerPiece: 456.7,
    userId: 43
  }
  @invalid_attrs %{checkInDate: nil, checkOutDate: nil, description: nil, laundryTypeName: nil, numPieces: nil, pricePerPiece: nil, userId: nil}

  def fixture(:unit_laundry_transaction) do
    {:ok, unit_laundry_transaction} = Laundry.create_unit_laundry_transaction(@create_attrs)
    unit_laundry_transaction
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all unit_laundry_transactions", %{conn: conn} do
      conn = get(conn, Routes.unit_laundry_transaction_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create unit_laundry_transaction" do
    test "renders unit_laundry_transaction when data is valid", %{conn: conn} do
      conn = post(conn, Routes.unit_laundry_transaction_path(conn, :create), unit_laundry_transaction: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.unit_laundry_transaction_path(conn, :show, id))

      assert %{
               "id" => id,
               "checkInDate" => "2010-04-17T14:00:00.000000Z",
               "checkOutDate" => "2010-04-17T14:00:00.000000Z",
               "description" => "some description",
               "laundryTypeName" => "some laundryTypeName",
               "numPieces" => 42,
               "pricePerPiece" => 120.5,
               "userId" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.unit_laundry_transaction_path(conn, :create), unit_laundry_transaction: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update unit_laundry_transaction" do
    setup [:create_unit_laundry_transaction]

    test "renders unit_laundry_transaction when data is valid", %{conn: conn, unit_laundry_transaction: %UnitLaundryTransaction{id: id} = unit_laundry_transaction} do
      conn = put(conn, Routes.unit_laundry_transaction_path(conn, :update, unit_laundry_transaction), unit_laundry_transaction: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.unit_laundry_transaction_path(conn, :show, id))

      assert %{
               "id" => id,
               "checkInDate" => "2011-05-18T15:01:01.000000Z",
               "checkOutDate" => "2011-05-18T15:01:01.000000Z",
               "description" => "some updated description",
               "laundryTypeName" => "some updated laundryTypeName",
               "numPieces" => 43,
               "pricePerPiece" => 456.7,
               "userId" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, unit_laundry_transaction: unit_laundry_transaction} do
      conn = put(conn, Routes.unit_laundry_transaction_path(conn, :update, unit_laundry_transaction), unit_laundry_transaction: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete unit_laundry_transaction" do
    setup [:create_unit_laundry_transaction]

    test "deletes chosen unit_laundry_transaction", %{conn: conn, unit_laundry_transaction: unit_laundry_transaction} do
      conn = delete(conn, Routes.unit_laundry_transaction_path(conn, :delete, unit_laundry_transaction))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.unit_laundry_transaction_path(conn, :show, unit_laundry_transaction))
      end
    end
  end

  defp create_unit_laundry_transaction(_) do
    unit_laundry_transaction = fixture(:unit_laundry_transaction)
    %{unit_laundry_transaction: unit_laundry_transaction}
  end
end
