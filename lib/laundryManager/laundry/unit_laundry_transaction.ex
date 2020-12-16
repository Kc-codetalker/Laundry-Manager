defmodule LaundryManager.Laundry.UnitLaundryTransaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "unit_laundry_transactions" do
    field :checkInDate, :utc_datetime_usec
    field :checkOutDate, :utc_datetime_usec
    field :description, :string, default: ""
    field :laundryTypeName, :string
    field :numPieces, :integer
    field :pricePerPiece, :float
    field :userId, :integer

    timestamps()
  end

  @doc false
  def changeset(unit_laundry_transaction, attrs) do
    unit_laundry_transaction
    |> cast(attrs, [:userId, :laundryTypeName, :numPieces, :pricePerPiece, :description, :checkInDate, :checkOutDate])
    |> validate_required([:userId, :laundryTypeName, :numPieces, :pricePerPiece, :checkInDate, :checkOutDate])
  end
end
