defmodule LaundryManagerWeb.UnitLaundryTransactionView do
  use LaundryManagerWeb, :view
  alias LaundryManagerWeb.UnitLaundryTransactionView

  def render("index.json", %{unit_laundry_transactions: unit_laundry_transactions}) do
    %{data: render_many(unit_laundry_transactions, UnitLaundryTransactionView, "unit_laundry_transaction.json")}
  end

  def render("show.json", %{unit_laundry_transaction: unit_laundry_transaction}) do
    %{data: render_one(unit_laundry_transaction, UnitLaundryTransactionView, "unit_laundry_transaction.json")}
  end

  def render("unit_laundry_transaction.json", %{unit_laundry_transaction: unit_laundry_transaction}) do
    %{id: unit_laundry_transaction.id,
      userId: unit_laundry_transaction.userId,
      laundryTypeName: unit_laundry_transaction.laundryTypeName,
      numPieces: unit_laundry_transaction.numPieces,
      pricePerPiece: unit_laundry_transaction.pricePerPiece,
      description: unit_laundry_transaction.description,
      checkInDate: unit_laundry_transaction.checkInDate,
      checkOutDate: unit_laundry_transaction.checkOutDate}
  end

  def render("delete.json", %{unit_laundry_transaction: unit_laundry_transaction}) do
    %{message: "Unit laundry transaction with id: #{unit_laundry_transaction.id} is successfully deleted."}
  end
end
