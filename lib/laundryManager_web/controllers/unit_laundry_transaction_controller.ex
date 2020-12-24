defmodule LaundryManagerWeb.UnitLaundryTransactionController do
  use LaundryManagerWeb, :controller

  alias LaundryManager.Laundry
  alias LaundryManager.Laundry.UnitLaundryTransaction

  action_fallback LaundryManagerWeb.FallbackController

  def index(conn, filter_params) do
    unit_laundry_transactions = Laundry.list_unit_laundry_transactions(filter_params)
    render(conn, "index.json", unit_laundry_transactions: unit_laundry_transactions)
  end

  def create(conn, %{"unit_laundry_transaction" => unit_laundry_transaction_params}) do
    with {:ok, %UnitLaundryTransaction{} = unit_laundry_transaction} <- Laundry.create_unit_laundry_transaction(unit_laundry_transaction_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.unit_laundry_transaction_path(conn, :show, unit_laundry_transaction))
      |> render("show.json", unit_laundry_transaction: unit_laundry_transaction)
    end
  end

  def show(conn, %{"id" => id}) do
    unit_laundry_transaction = Laundry.get_unit_laundry_transaction!(id)
    render(conn, "show.json", unit_laundry_transaction: unit_laundry_transaction)
  end

  def update(conn, %{"id" => id, "unit_laundry_transaction" => unit_laundry_transaction_params}) do
    unit_laundry_transaction = Laundry.get_unit_laundry_transaction!(id)

    with {:ok, %UnitLaundryTransaction{} = unit_laundry_transaction} <- Laundry.update_unit_laundry_transaction(unit_laundry_transaction, unit_laundry_transaction_params) do
      render(conn, "show.json", unit_laundry_transaction: unit_laundry_transaction)
    end
  end

  def delete(conn, %{"id" => id}) do
    unit_laundry_transaction = Laundry.get_unit_laundry_transaction!(id)

    with {:ok, %UnitLaundryTransaction{}} <- Laundry.delete_unit_laundry_transaction(unit_laundry_transaction) do
      render(conn, "delete.json", unit_laundry_transaction: unit_laundry_transaction)
    end
  end
end
