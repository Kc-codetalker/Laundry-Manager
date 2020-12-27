defmodule LaundryManagerWeb.StatisticLaundryTransactionView do
  use LaundryManagerWeb, :view
  alias LaundryManagerWeb.StatisticLaundryTransactionView

  def render("statistic.json", %{statistic_laundry: statistic_laundry}) do
    %{mean: statistic_laundry.mean,
      totalLaundry: statistic_laundry.totalLaundry,
      totalSpend: statistic_laundry.totalSpend}
  end
  def render("kilogram.json", %{statistic_laundry: statistic_laundry}) do
    %{mean: statistic_laundry.mean,
      totalLaundry: statistic_laundry.count}
  end
end
