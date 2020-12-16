defmodule LaundryManagerWeb.KilogramLaundryTransactionView do
  use LaundryManagerWeb, :view
  alias LaundryManagerWeb.KilogramLaundryTransactionView

  def render("index.json", %{kilogram_laundry_transactions: kilogram_laundry_transactions}) do
    %{data: render_many(kilogram_laundry_transactions, KilogramLaundryTransactionView, "kilogram_laundry_transaction.json")}
  end

  def render("show.json", %{kilogram_laundry_transaction: kilogram_laundry_transaction}) do
    %{data: render_one(kilogram_laundry_transaction, KilogramLaundryTransactionView, "kilogram_laundry_transaction.json")}
  end

  def render("kilogram_laundry_transaction.json", %{kilogram_laundry_transaction: kilogram_laundry_transaction}) do
    %{id: kilogram_laundry_transaction.id,
      userId: kilogram_laundry_transaction.userId,
      laundryTypeName: kilogram_laundry_transaction.laundryTypeName,
      weight: kilogram_laundry_transaction.weight,
      pricePerWeight: kilogram_laundry_transaction.pricePerWeight,
      description: kilogram_laundry_transaction.description,
      checkInDate: kilogram_laundry_transaction.checkInDate,
      checkOutDate: kilogram_laundry_transaction.checkOutDate}
  end

  def render("delete.json", %{kilogram_laundry_transaction: kilogram_laundry_transaction}) do
    %{message: "Kilogram laundry transaction with id: #{kilogram_laundry_transaction.id} is successfully deleted."}
  end
end
