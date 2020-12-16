defmodule LaundryManager.Laundry.LaundryType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "laundry_types" do
    field :isKilogram, :boolean, default: false
    field :isUnit, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(laundry_type, attrs) do
    laundry_type
    |> cast(attrs, [:name, :isKilogram, :isUnit])
    |> validate_required([:name, :isKilogram, :isUnit])
    |> unique_constraint(:name)
  end
end
