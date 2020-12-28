defmodule LaundryManagerWeb.StatisticLaundryTransactionController do
    use LaundryManagerWeb, :controller
    
    alias LaundryManager.Laundry

    action_fallback LaundryManagerWeb.FallbackController
    
    def getSecondFromDate(filter) do
        case filter do
            "1-minggu" ->
                - 7 * 24 * 3600
            "1-bulan"->
                - 30 * 24 * 3600
            "3-bulan"->
                - 90 * 24 * 3600
            _ ->
                0
        end
    end

    def kilogramStatistic(conn, filter_params \\ %{}) do
        stopDatetimeUTC = NaiveDateTime.utc_now()
        filter = filter_params["filter"]
        seconds = getSecondFromDate(filter)
        startDatetimeUTC = NaiveDateTime.utc_now() |> NaiveDateTime.add(seconds)
        statistic_laundry = Laundry.get_statistic_kilogram_laundry_transactions(startDatetimeUTC, stopDatetimeUTC)
        data = Laundry.get_data_kilogram_laundry_transactions(startDatetimeUTC, stopDatetimeUTC)
        statistic_laundry = Map.put(statistic_laundry, :data, data)
        render(conn, "statistic.json", statistic_laundry: statistic_laundry)
    end
    
    def unitStatistic(conn, filter_params) do
        stopDatetimeUTC = NaiveDateTime.utc_now()
        filter = filter_params["filter"]
        seconds = getSecondFromDate(filter)
        startDatetimeUTC = NaiveDateTime.utc_now() |> NaiveDateTime.add(seconds)
        statistic_laundry = Laundry.get_statistic_unit_laundry_transactions(startDatetimeUTC, stopDatetimeUTC)
        data = Laundry.get_data_unit_laundry_transactions(startDatetimeUTC, stopDatetimeUTC)
        statistic_laundry = Map.put(statistic_laundry, :data, data)
        render(conn, "statistic.json", statistic_laundry: statistic_laundry)
    end
end