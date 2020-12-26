defmodule LaundryManagerWeb.StatisticLaundryTransactionController do
    use LaundryManagerWeb, :controller
    
    alias LaundryManager.Laundry

    action_fallback LaundryManagerWeb.FallbackController

    def kilogramStatistic(conn, filter_params) do
        statistic_laundry = %{data: [], mean: 35, totalLaundry: 4, totalSpend: 123000}
        render(conn, "statistic.json", statistic_laundry: statistic_laundry)
    end
    
    def unitStatistic(conn, filter_params) do
        statistic_laundry = %{data: [], mean: 35, totalLaundry: 4, totalSpend: 123000}
        render(conn, "statistic.json", statistic_laundry: statistic_laundry)
    end

    def typeStatistic(conn, filter_params) do
        statistic_laundry = %{data: [], mean: 35, totalLaundry: 4, totalSpend: 123000}
        render(conn, "statistic.json", statistic_laundry: statistic_laundry)
    end
end