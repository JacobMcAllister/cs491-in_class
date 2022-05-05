defmodule InClass.DevelopmentFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `InClass.Development` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        area: "some area",
        due_date: "some due_date",
        name: "some name",
        status: "some status"
      })
      |> InClass.Development.create_task()

    task
  end

  @doc """
  Generate a assignment.
  """
  def assignment_fixture(attrs \\ %{}) do
    {:ok, assignment} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> InClass.Development.create_assignment()

    assignment
  end
end
