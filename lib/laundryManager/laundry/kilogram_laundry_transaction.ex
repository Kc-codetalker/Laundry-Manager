defmodule LaundryManager.Laundry.KilogramLaundryTransaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "kilogram_laundry_transactions" do
    field :checkInDate, :utc_datetime_usec
    field :checkOutDate, :utc_datetime_usec
    field :description, :string, default: ""
    field :laundryTypeName, :string
    field :pricePerWeight, :float
    field :userId, :integer
    field :weight, :float

    timestamps()
  end

  @doc false
  def changeset(kilogram_laundry_transaction, attrs) do
    kilogram_laundry_transaction
    |> cast(attrs, [:userId, :laundryTypeName, :weight, :pricePerWeight, :description, :checkInDate, :checkOutDate])
    |> validate_required([:userId, :laundryTypeName, :weight, :pricePerWeight, :checkInDate, :checkOutDate])
  end
end
