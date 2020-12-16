defmodule LaundryManager.LaundryTest do
  use LaundryManager.DataCase

  alias LaundryManager.Laundry

  describe "kilogram_laundry_transactions" do
    alias LaundryManager.Laundry.KilogramLaundryTransaction

    @valid_attrs %{checkInDate: "2010-04-17T14:00:00.000000Z", checkOutDate: "2010-04-17T14:00:00.000000Z", description: "some description", laundryTypeName: "some laundryTypeName", pricePerWeight: 120.5, userId: 42, weight: 120.5}
    @update_attrs %{checkInDate: "2011-05-18T15:01:01.000000Z", checkOutDate: "2011-05-18T15:01:01.000000Z", description: "some updated description", laundryTypeName: "some updated laundryTypeName", pricePerWeight: 456.7, userId: 43, weight: 456.7}
    @invalid_attrs %{checkInDate: nil, checkOutDate: nil, description: nil, laundryTypeName: nil, pricePerWeight: nil, userId: nil, weight: nil}

    def kilogram_laundry_transaction_fixture(attrs \\ %{}) do
      {:ok, kilogram_laundry_transaction} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Laundry.create_kilogram_laundry_transaction()

      kilogram_laundry_transaction
    end

    test "list_kilogram_laundry_transactions/0 returns all kilogram_laundry_transactions" do
      kilogram_laundry_transaction = kilogram_laundry_transaction_fixture()
      assert Laundry.list_kilogram_laundry_transactions() == [kilogram_laundry_transaction]
    end

    test "get_kilogram_laundry_transaction!/1 returns the kilogram_laundry_transaction with given id" do
      kilogram_laundry_transaction = kilogram_laundry_transaction_fixture()
      assert Laundry.get_kilogram_laundry_transaction!(kilogram_laundry_transaction.id) == kilogram_laundry_transaction
    end

    test "create_kilogram_laundry_transaction/1 with valid data creates a kilogram_laundry_transaction" do
      assert {:ok, %KilogramLaundryTransaction{} = kilogram_laundry_transaction} = Laundry.create_kilogram_laundry_transaction(@valid_attrs)
      assert kilogram_laundry_transaction.checkInDate == DateTime.from_naive!(~N[2010-04-17T14:00:00.000000Z], "Etc/UTC")
      assert kilogram_laundry_transaction.checkOutDate == DateTime.from_naive!(~N[2010-04-17T14:00:00.000000Z], "Etc/UTC")
      assert kilogram_laundry_transaction.description == "some description"
      assert kilogram_laundry_transaction.laundryTypeName == "some laundryTypeName"
      assert kilogram_laundry_transaction.pricePerWeight == 120.5
      assert kilogram_laundry_transaction.userId == 42
      assert kilogram_laundry_transaction.weight == 120.5
    end

    test "create_kilogram_laundry_transaction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Laundry.create_kilogram_laundry_transaction(@invalid_attrs)
    end

    test "update_kilogram_laundry_transaction/2 with valid data updates the kilogram_laundry_transaction" do
      kilogram_laundry_transaction = kilogram_laundry_transaction_fixture()
      assert {:ok, %KilogramLaundryTransaction{} = kilogram_laundry_transaction} = Laundry.update_kilogram_laundry_transaction(kilogram_laundry_transaction, @update_attrs)
      assert kilogram_laundry_transaction.checkInDate == DateTime.from_naive!(~N[2011-05-18T15:01:01.000000Z], "Etc/UTC")
      assert kilogram_laundry_transaction.checkOutDate == DateTime.from_naive!(~N[2011-05-18T15:01:01.000000Z], "Etc/UTC")
      assert kilogram_laundry_transaction.description == "some updated description"
      assert kilogram_laundry_transaction.laundryTypeName == "some updated laundryTypeName"
      assert kilogram_laundry_transaction.pricePerWeight == 456.7
      assert kilogram_laundry_transaction.userId == 43
      assert kilogram_laundry_transaction.weight == 456.7
    end

    test "update_kilogram_laundry_transaction/2 with invalid data returns error changeset" do
      kilogram_laundry_transaction = kilogram_laundry_transaction_fixture()
      assert {:error, %Ecto.Changeset{}} = Laundry.update_kilogram_laundry_transaction(kilogram_laundry_transaction, @invalid_attrs)
      assert kilogram_laundry_transaction == Laundry.get_kilogram_laundry_transaction!(kilogram_laundry_transaction.id)
    end

    test "delete_kilogram_laundry_transaction/1 deletes the kilogram_laundry_transaction" do
      kilogram_laundry_transaction = kilogram_laundry_transaction_fixture()
      assert {:ok, %KilogramLaundryTransaction{}} = Laundry.delete_kilogram_laundry_transaction(kilogram_laundry_transaction)
      assert_raise Ecto.NoResultsError, fn -> Laundry.get_kilogram_laundry_transaction!(kilogram_laundry_transaction.id) end
    end

    test "change_kilogram_laundry_transaction/1 returns a kilogram_laundry_transaction changeset" do
      kilogram_laundry_transaction = kilogram_laundry_transaction_fixture()
      assert %Ecto.Changeset{} = Laundry.change_kilogram_laundry_transaction(kilogram_laundry_transaction)
    end
  end

  describe "unit_laundry_transactions" do
    alias LaundryManager.Laundry.UnitLaundryTransaction

    @valid_attrs %{checkInDate: "2010-04-17T14:00:00.000000Z", checkOutDate: "2010-04-17T14:00:00.000000Z", description: "some description", laundryTypeName: "some laundryTypeName", numPieces: 42, pricePerPiece: 120.5, userId: 42}
    @update_attrs %{checkInDate: "2011-05-18T15:01:01.000000Z", checkOutDate: "2011-05-18T15:01:01.000000Z", description: "some updated description", laundryTypeName: "some updated laundryTypeName", numPieces: 43, pricePerPiece: 456.7, userId: 43}
    @invalid_attrs %{checkInDate: nil, checkOutDate: nil, description: nil, laundryTypeName: nil, numPieces: nil, pricePerPiece: nil, userId: nil}

    def unit_laundry_transaction_fixture(attrs \\ %{}) do
      {:ok, unit_laundry_transaction} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Laundry.create_unit_laundry_transaction()

      unit_laundry_transaction
    end

    test "list_unit_laundry_transactions/0 returns all unit_laundry_transactions" do
      unit_laundry_transaction = unit_laundry_transaction_fixture()
      assert Laundry.list_unit_laundry_transactions() == [unit_laundry_transaction]
    end

    test "get_unit_laundry_transaction!/1 returns the unit_laundry_transaction with given id" do
      unit_laundry_transaction = unit_laundry_transaction_fixture()
      assert Laundry.get_unit_laundry_transaction!(unit_laundry_transaction.id) == unit_laundry_transaction
    end

    test "create_unit_laundry_transaction/1 with valid data creates a unit_laundry_transaction" do
      assert {:ok, %UnitLaundryTransaction{} = unit_laundry_transaction} = Laundry.create_unit_laundry_transaction(@valid_attrs)
      assert unit_laundry_transaction.checkInDate == DateTime.from_naive!(~N[2010-04-17T14:00:00.000000Z], "Etc/UTC")
      assert unit_laundry_transaction.checkOutDate == DateTime.from_naive!(~N[2010-04-17T14:00:00.000000Z], "Etc/UTC")
      assert unit_laundry_transaction.description == "some description"
      assert unit_laundry_transaction.laundryTypeName == "some laundryTypeName"
      assert unit_laundry_transaction.numPieces == 42
      assert unit_laundry_transaction.pricePerPiece == 120.5
      assert unit_laundry_transaction.userId == 42
    end

    test "create_unit_laundry_transaction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Laundry.create_unit_laundry_transaction(@invalid_attrs)
    end

    test "update_unit_laundry_transaction/2 with valid data updates the unit_laundry_transaction" do
      unit_laundry_transaction = unit_laundry_transaction_fixture()
      assert {:ok, %UnitLaundryTransaction{} = unit_laundry_transaction} = Laundry.update_unit_laundry_transaction(unit_laundry_transaction, @update_attrs)
      assert unit_laundry_transaction.checkInDate == DateTime.from_naive!(~N[2011-05-18T15:01:01.000000Z], "Etc/UTC")
      assert unit_laundry_transaction.checkOutDate == DateTime.from_naive!(~N[2011-05-18T15:01:01.000000Z], "Etc/UTC")
      assert unit_laundry_transaction.description == "some updated description"
      assert unit_laundry_transaction.laundryTypeName == "some updated laundryTypeName"
      assert unit_laundry_transaction.numPieces == 43
      assert unit_laundry_transaction.pricePerPiece == 456.7
      assert unit_laundry_transaction.userId == 43
    end

    test "update_unit_laundry_transaction/2 with invalid data returns error changeset" do
      unit_laundry_transaction = unit_laundry_transaction_fixture()
      assert {:error, %Ecto.Changeset{}} = Laundry.update_unit_laundry_transaction(unit_laundry_transaction, @invalid_attrs)
      assert unit_laundry_transaction == Laundry.get_unit_laundry_transaction!(unit_laundry_transaction.id)
    end

    test "delete_unit_laundry_transaction/1 deletes the unit_laundry_transaction" do
      unit_laundry_transaction = unit_laundry_transaction_fixture()
      assert {:ok, %UnitLaundryTransaction{}} = Laundry.delete_unit_laundry_transaction(unit_laundry_transaction)
      assert_raise Ecto.NoResultsError, fn -> Laundry.get_unit_laundry_transaction!(unit_laundry_transaction.id) end
    end

    test "change_unit_laundry_transaction/1 returns a unit_laundry_transaction changeset" do
      unit_laundry_transaction = unit_laundry_transaction_fixture()
      assert %Ecto.Changeset{} = Laundry.change_unit_laundry_transaction(unit_laundry_transaction)
    end
  end

  describe "laundry_types" do
    alias LaundryManager.Laundry.LaundryType

    @valid_attrs %{isKilogram: true, isUnit: true, name: "some name"}
    @update_attrs %{isKilogram: false, isUnit: false, name: "some updated name"}
    @invalid_attrs %{isKilogram: nil, isUnit: nil, name: nil}

    def laundry_type_fixture(attrs \\ %{}) do
      {:ok, laundry_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Laundry.create_laundry_type()

      laundry_type
    end

    test "list_laundry_types/0 returns all laundry_types" do
      laundry_type = laundry_type_fixture()
      assert Laundry.list_laundry_types() == [laundry_type]
    end

    test "get_laundry_type!/1 returns the laundry_type with given id" do
      laundry_type = laundry_type_fixture()
      assert Laundry.get_laundry_type!(laundry_type.id) == laundry_type
    end

    test "create_laundry_type/1 with valid data creates a laundry_type" do
      assert {:ok, %LaundryType{} = laundry_type} = Laundry.create_laundry_type(@valid_attrs)
      assert laundry_type.isKilogram == true
      assert laundry_type.isUnit == true
      assert laundry_type.name == "some name"
    end

    test "create_laundry_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Laundry.create_laundry_type(@invalid_attrs)
    end

    test "update_laundry_type/2 with valid data updates the laundry_type" do
      laundry_type = laundry_type_fixture()
      assert {:ok, %LaundryType{} = laundry_type} = Laundry.update_laundry_type(laundry_type, @update_attrs)
      assert laundry_type.isKilogram == false
      assert laundry_type.isUnit == false
      assert laundry_type.name == "some updated name"
    end

    test "update_laundry_type/2 with invalid data returns error changeset" do
      laundry_type = laundry_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Laundry.update_laundry_type(laundry_type, @invalid_attrs)
      assert laundry_type == Laundry.get_laundry_type!(laundry_type.id)
    end

    test "delete_laundry_type/1 deletes the laundry_type" do
      laundry_type = laundry_type_fixture()
      assert {:ok, %LaundryType{}} = Laundry.delete_laundry_type(laundry_type)
      assert_raise Ecto.NoResultsError, fn -> Laundry.get_laundry_type!(laundry_type.id) end
    end

    test "change_laundry_type/1 returns a laundry_type changeset" do
      laundry_type = laundry_type_fixture()
      assert %Ecto.Changeset{} = Laundry.change_laundry_type(laundry_type)
    end
  end
end
