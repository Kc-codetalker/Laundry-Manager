defmodule LaundryManagerWeb.LaundryTypeView do
  use LaundryManagerWeb, :view
  alias LaundryManagerWeb.LaundryTypeView

  def render("index.json", %{laundry_types: laundry_types}) do
    %{data: render_many(laundry_types, LaundryTypeView, "laundry_type.json")}
  end

  def render("show.json", %{laundry_type: laundry_type}) do
    %{data: render_one(laundry_type, LaundryTypeView, "laundry_type.json")}
  end

  def render("laundry_type.json", %{laundry_type: laundry_type}) do
    %{id: laundry_type.id,
      name: laundry_type.name,
      isKilogram: laundry_type.isKilogram,
      isUnit: laundry_type.isUnit}
  end

  def render("delete.json", %{laundry_type: laundry_type}) do
    %{message: "Laundry type with id: #{laundry_type.id} is successfully deleted."}
  end
end
