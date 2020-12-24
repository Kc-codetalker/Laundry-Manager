defmodule LaundryManager.Laundry do
  @moduledoc """
  The Laundry context.
  """

  import Ecto.Query, warn: false
  alias LaundryManager.Repo

  alias LaundryManager.Laundry.KilogramLaundryTransaction
  alias LaundryManager.Laundry.UnitLaundryTransaction
  alias LaundryManager.Laundry.LaundryType


  defp apply_common_list_filters(query, params) do
    query
    |> add_filter_to_list_query(params, "checkInStartDate")
    |> add_filter_to_list_query(params, "checkInEndDate")
    |> add_filter_to_list_query(params, "checkOutStartDate")
    |> add_filter_to_list_query(params, "checkOutEndDate")
    |> add_filter_to_list_query(params, "laundryTypeName")
  end

  defp compose_kilo_laundry_list_query(params) do
    base_query = from t in KilogramLaundryTransaction
    apply_common_list_filters(base_query, params)
    |> add_filter_to_list_query(params, "minWeight")
    |> add_filter_to_list_query(params, "maxWeight")
    |> add_filter_to_list_query(params, "minPricePerWeight")
    |> add_filter_to_list_query(params, "maxPricePerWeight")
  end

  defp compose_unit_laundry_list_query(params) do
    base_query = from t in UnitLaundryTransaction
    apply_common_list_filters(base_query, params)
    |> add_filter_to_list_query(params, "minPieces")
    |> add_filter_to_list_query(params, "maxPieces")
    |> add_filter_to_list_query(params, "minPricePerPiece")
    |> add_filter_to_list_query(params, "maxPricePerPiece")
  end

  defp add_filter_to_list_query(query, params, filter_name) do
    with {:ok, filter_value} <- Map.fetch(params, filter_name) do
      case filter_name do
        "checkInStartDate" ->
          from t in query, where: t.checkInDate >= ^filter_value
        "checkInEndDate" ->
          from t in query, where: t.checkInDate <= ^filter_value
        "checkOutStartDate" ->
          from t in query, where: t.checkOutDate >= ^filter_value
        "checkOutEndDate" ->
          from t in query, where: t.checkOutDate <= ^filter_value
        "laundryTypeName" ->
          from t in query, where: t.laundryTypeName == ^filter_value
        "minPricePerWeight" ->
          from t in query, where: t.pricePerWeight >= ^filter_value
        "maxPricePerWeight" ->
          from t in query, where: t.pricePerWeight <= ^filter_value
        "minWeight" ->
          from t in query, where: t.weight >= ^filter_value
        "maxWeight" ->
          from t in query, where: t.weight <= ^filter_value
        "minPricePerPiece" ->
          from t in query, where: t.pricePerPiece >= ^filter_value
        "maxPricePerPiece" ->
          from t in query, where: t.pricePerPiece <= ^filter_value
        "minPieces" ->
          from t in query, where: t.numPieces >= ^filter_value
        "maxPieces" ->
          from t in query, where: t.numPieces <= ^filter_value
        _ ->
          query
      end
    else
      _ -> query
    end
  end

  @doc """
  Returns the list of kilogram_laundry_transactions.

  ## Examples

      iex> list_kilogram_laundry_transactions()
      [%KilogramLaundryTransaction{}, ...]

  """
  def list_kilogram_laundry_transactions(attrs \\ %{}) do
    Repo.all(compose_kilo_laundry_list_query(attrs))
  end

  @doc """
  Gets a single kilogram_laundry_transaction.

  Raises `Ecto.NoResultsError` if the Kilogram laundry transaction does not exist.

  ## Examples

      iex> get_kilogram_laundry_transaction!(123)
      %KilogramLaundryTransaction{}

      iex> get_kilogram_laundry_transaction!(456)
      ** (Ecto.NoResultsError)

  """
  def get_kilogram_laundry_transaction!(id), do: Repo.get!(KilogramLaundryTransaction, id)

  @doc """
  Creates a kilogram_laundry_transaction.

  ## Examples

      iex> create_kilogram_laundry_transaction(%{field: value})
      {:ok, %KilogramLaundryTransaction{}}

      iex> create_kilogram_laundry_transaction(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_kilogram_laundry_transaction(attrs \\ %{}) do
    %KilogramLaundryTransaction{}
    |> KilogramLaundryTransaction.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a kilogram_laundry_transaction.

  ## Examples

      iex> update_kilogram_laundry_transaction(kilogram_laundry_transaction, %{field: new_value})
      {:ok, %KilogramLaundryTransaction{}}

      iex> update_kilogram_laundry_transaction(kilogram_laundry_transaction, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_kilogram_laundry_transaction(%KilogramLaundryTransaction{} = kilogram_laundry_transaction, attrs) do
    kilogram_laundry_transaction
    |> KilogramLaundryTransaction.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a kilogram_laundry_transaction.

  ## Examples

      iex> delete_kilogram_laundry_transaction(kilogram_laundry_transaction)
      {:ok, %KilogramLaundryTransaction{}}

      iex> delete_kilogram_laundry_transaction(kilogram_laundry_transaction)
      {:error, %Ecto.Changeset{}}

  """
  def delete_kilogram_laundry_transaction(%KilogramLaundryTransaction{} = kilogram_laundry_transaction) do
    Repo.delete(kilogram_laundry_transaction)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking kilogram_laundry_transaction changes.

  ## Examples

      iex> change_kilogram_laundry_transaction(kilogram_laundry_transaction)
      %Ecto.Changeset{data: %KilogramLaundryTransaction{}}

  """
  def change_kilogram_laundry_transaction(%KilogramLaundryTransaction{} = kilogram_laundry_transaction, attrs \\ %{}) do
    KilogramLaundryTransaction.changeset(kilogram_laundry_transaction, attrs)
  end

  @doc """
  Returns the list of unit_laundry_transactions.

  ## Examples

      iex> list_unit_laundry_transactions()
      [%UnitLaundryTransaction{}, ...]

  """
  def list_unit_laundry_transactions(attrs \\ %{}) do
    Repo.all(compose_unit_laundry_list_query(attrs))
  end

  @doc """
  Gets a single unit_laundry_transaction.

  Raises `Ecto.NoResultsError` if the Unit laundry transaction does not exist.

  ## Examples

      iex> get_unit_laundry_transaction!(123)
      %UnitLaundryTransaction{}

      iex> get_unit_laundry_transaction!(456)
      ** (Ecto.NoResultsError)

  """
  def get_unit_laundry_transaction!(id), do: Repo.get!(UnitLaundryTransaction, id)

  @doc """
  Creates a unit_laundry_transaction.

  ## Examples

      iex> create_unit_laundry_transaction(%{field: value})
      {:ok, %UnitLaundryTransaction{}}

      iex> create_unit_laundry_transaction(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_unit_laundry_transaction(attrs \\ %{}) do
    %UnitLaundryTransaction{}
    |> UnitLaundryTransaction.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a unit_laundry_transaction.

  ## Examples

      iex> update_unit_laundry_transaction(unit_laundry_transaction, %{field: new_value})
      {:ok, %UnitLaundryTransaction{}}

      iex> update_unit_laundry_transaction(unit_laundry_transaction, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_unit_laundry_transaction(%UnitLaundryTransaction{} = unit_laundry_transaction, attrs) do
    unit_laundry_transaction
    |> UnitLaundryTransaction.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a unit_laundry_transaction.

  ## Examples

      iex> delete_unit_laundry_transaction(unit_laundry_transaction)
      {:ok, %UnitLaundryTransaction{}}

      iex> delete_unit_laundry_transaction(unit_laundry_transaction)
      {:error, %Ecto.Changeset{}}

  """
  def delete_unit_laundry_transaction(%UnitLaundryTransaction{} = unit_laundry_transaction) do
    Repo.delete(unit_laundry_transaction)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking unit_laundry_transaction changes.

  ## Examples

      iex> change_unit_laundry_transaction(unit_laundry_transaction)
      %Ecto.Changeset{data: %UnitLaundryTransaction{}}

  """
  def change_unit_laundry_transaction(%UnitLaundryTransaction{} = unit_laundry_transaction, attrs \\ %{}) do
    UnitLaundryTransaction.changeset(unit_laundry_transaction, attrs)
  end

  @doc """
  Returns the list of laundry_types.

  ## Examples

      iex> list_laundry_types()
      [%LaundryType{}, ...]

  """
  def list_laundry_types do
    Repo.all(LaundryType)
  end

  @doc """
  Gets a single laundry_type.

  Raises `Ecto.NoResultsError` if the Laundry type does not exist.

  ## Examples

      iex> get_laundry_type!(123)
      %LaundryType{}

      iex> get_laundry_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_laundry_type!(id), do: Repo.get!(LaundryType, id)

  @doc """
  Creates a laundry_type.

  ## Examples

      iex> create_laundry_type(%{field: value})
      {:ok, %LaundryType{}}

      iex> create_laundry_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_laundry_type(attrs \\ %{}) do
    %LaundryType{}
    |> LaundryType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a laundry_type.

  ## Examples

      iex> update_laundry_type(laundry_type, %{field: new_value})
      {:ok, %LaundryType{}}

      iex> update_laundry_type(laundry_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_laundry_type(%LaundryType{} = laundry_type, attrs) do
    laundry_type
    |> LaundryType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a laundry_type.

  ## Examples

      iex> delete_laundry_type(laundry_type)
      {:ok, %LaundryType{}}

      iex> delete_laundry_type(laundry_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_laundry_type(%LaundryType{} = laundry_type) do
    Repo.delete(laundry_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking laundry_type changes.

  ## Examples

      iex> change_laundry_type(laundry_type)
      %Ecto.Changeset{data: %LaundryType{}}

  """
  def change_laundry_type(%LaundryType{} = laundry_type, attrs \\ %{}) do
    LaundryType.changeset(laundry_type, attrs)
  end
end
