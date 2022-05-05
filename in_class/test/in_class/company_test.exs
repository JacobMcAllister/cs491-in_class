defmodule InClass.CompanyTest do
  use InClass.DataCase

  alias InClass.Company

  describe "developers" do
    alias InClass.Company.Developer

    import InClass.CompanyFixtures

    @invalid_attrs %{email: nil, expertise: nil, first_name: nil, last_name: nil}

    test "list_developers/0 returns all developers" do
      developer = developer_fixture()
      assert Company.list_developers() == [developer]
    end

    test "get_developer!/1 returns the developer with given id" do
      developer = developer_fixture()
      assert Company.get_developer!(developer.id) == developer
    end

    test "create_developer/1 with valid data creates a developer" do
      valid_attrs = %{email: "some email", expertise: "some expertise", first_name: "some first_name", last_name: "some last_name"}

      assert {:ok, %Developer{} = developer} = Company.create_developer(valid_attrs)
      assert developer.email == "some email"
      assert developer.expertise == "some expertise"
      assert developer.first_name == "some first_name"
      assert developer.last_name == "some last_name"
    end

    test "create_developer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Company.create_developer(@invalid_attrs)
    end

    test "update_developer/2 with valid data updates the developer" do
      developer = developer_fixture()
      update_attrs = %{email: "some updated email", expertise: "some updated expertise", first_name: "some updated first_name", last_name: "some updated last_name"}

      assert {:ok, %Developer{} = developer} = Company.update_developer(developer, update_attrs)
      assert developer.email == "some updated email"
      assert developer.expertise == "some updated expertise"
      assert developer.first_name == "some updated first_name"
      assert developer.last_name == "some updated last_name"
    end

    test "update_developer/2 with invalid data returns error changeset" do
      developer = developer_fixture()
      assert {:error, %Ecto.Changeset{}} = Company.update_developer(developer, @invalid_attrs)
      assert developer == Company.get_developer!(developer.id)
    end

    test "delete_developer/1 deletes the developer" do
      developer = developer_fixture()
      assert {:ok, %Developer{}} = Company.delete_developer(developer)
      assert_raise Ecto.NoResultsError, fn -> Company.get_developer!(developer.id) end
    end

    test "change_developer/1 returns a developer changeset" do
      developer = developer_fixture()
      assert %Ecto.Changeset{} = Company.change_developer(developer)
    end
  end
end
