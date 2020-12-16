defmodule LaundryManager.Repo.Migrations.CreateKilogramLaundryTransactions do
  use Ecto.Migration

  def change do
    create table(:kilogram_laundry_transactions) do
      add :userId, :integer
      add :laundryTypeName, :string
      add :weight, :float
      add :pricePerWeight, :float
      add :description, :string
      add :checkInDate, :utc_datetime_usec
      add :checkOutDate, :utc_datetime_usec

      timestamps()
    end

  end
end
