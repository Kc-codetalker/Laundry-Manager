defmodule LaundryManager.Repo.Migrations.CreateLaundryTypes do
  use Ecto.Migration

  def change do
    create table(:laundry_types) do
      add :name, :string
      add :isKilogram, :boolean, default: false, null: false
      add :isUnit, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:laundry_types, [:name])
  end
end
