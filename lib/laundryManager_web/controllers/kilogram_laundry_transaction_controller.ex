defmodule LaundryManagerWeb.KilogramLaundryTransactionController do
  use LaundryManagerWeb, :controller

  alias LaundryManager.Laundry
  alias LaundryManager.Laundry.KilogramLaundryTransaction

  action_fallback LaundryManagerWeb.FallbackController

  def index(conn, _params) do
    kilogram_laundry_transactions = Laundry.list_kilogram_laundry_transactions()
    render(conn, "index.json", kilogram_laundry_transactions: kilogram_laundry_transactions)
  end

  def create(conn, %{"kilogram_laundry_transaction" => kilogram_laundry_transaction_params}) do
    with {:ok, %KilogramLaundryTransaction{} = kilogram_laundry_transaction} <- Laundry.create_kilogram_laundry_transaction(kilogram_laundry_transaction_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.kilogram_laundry_transaction_path(conn, :show, kilogram_laundry_transaction))
      |> render("show.json", kilogram_laundry_transaction: kilogram_laundry_transaction)
    end
  end

  def show(conn, %{"id" => id}) do
    kilogram_laundry_transaction = Laundry.get_kilogram_laundry_transaction!(id)
    render(conn, "show.json", kilogram_laundry_transaction: kilogram_laundry_transaction)
  end

  def update(conn, %{"id" => id, "kilogram_laundry_transaction" => kilogram_laundry_transaction_params}) do
    kilogram_laundry_transaction = Laundry.get_kilogram_laundry_transaction!(id)

    with {:ok, %KilogramLaundryTransaction{} = kilogram_laundry_transaction} <- Laundry.update_kilogram_laundry_transaction(kilogram_laundry_transaction, kilogram_laundry_transaction_params) do
      render(conn, "show.json", kilogram_laundry_transaction: kilogram_laundry_transaction)
    end
  end

  def delete(conn, %{"id" => id}) do
    kilogram_laundry_transaction = Laundry.get_kilogram_laundry_transaction!(id)

    with {:ok, %KilogramLaundryTransaction{}} <- Laundry.delete_kilogram_laundry_transaction(kilogram_laundry_transaction) do
      render(conn, "delete.json", kilogram_laundry_transaction: kilogram_laundry_transaction)
    end
  end
end
