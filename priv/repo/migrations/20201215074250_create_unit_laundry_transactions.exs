defmodule LaundryManager.Repo.Migrations.CreateUnitLaundryTransactions do
  use Ecto.Migration

  def change do
    create table(:unit_laundry_transactions) do
      add :userId, :integer
      add :laundryTypeName, :string
      add :numPieces, :integer
      add :pricePerPiece, :float
      add :description, :string
      add :checkInDate, :utc_datetime_usec
      add :checkOutDate, :utc_datetime_usec

      timestamps()
    end

  end
end
