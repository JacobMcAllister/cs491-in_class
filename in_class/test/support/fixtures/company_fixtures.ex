defmodule InClass.CompanyFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `InClass.Company` context.
  """

  @doc """
  Generate a developer.
  """
  def developer_fixture(attrs \\ %{}) do
    {:ok, developer} =
      attrs
      |> Enum.into(%{
        email: "some email",
        expertise: "some expertise",
        first_name: "some first_name",
        last_name: "some last_name"
      })
      |> InClass.Company.create_developer()

    developer
  end
end
