defmodule InClass.DevelopmentTest do
  use InClass.DataCase

  alias InClass.Development

  describe "tasks" do
    alias InClass.Development.Task

    import InClass.DevelopmentFixtures

    @invalid_attrs %{area: nil, due_date: nil, name: nil, status: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Development.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Development.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{area: "some area", due_date: "some due_date", name: "some name", status: "some status"}

      assert {:ok, %Task{} = task} = Development.create_task(valid_attrs)
      assert task.area == "some area"
      assert task.due_date == "some due_date"
      assert task.name == "some name"
      assert task.status == "some status"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Development.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{area: "some updated area", due_date: "some updated due_date", name: "some updated name", status: "some updated status"}

      assert {:ok, %Task{} = task} = Development.update_task(task, update_attrs)
      assert task.area == "some updated area"
      assert task.due_date == "some updated due_date"
      assert task.name == "some updated name"
      assert task.status == "some updated status"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Development.update_task(task, @invalid_attrs)
      assert task == Development.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Development.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Development.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Development.change_task(task)
    end
  end

  describe "assignments" do
    alias InClass.Development.Assignment

    import InClass.DevelopmentFixtures

    @invalid_attrs %{description: nil, name: nil}

    test "list_assignments/0 returns all assignments" do
      assignment = assignment_fixture()
      assert Development.list_assignments() == [assignment]
    end

    test "get_assignment!/1 returns the assignment with given id" do
      assignment = assignment_fixture()
      assert Development.get_assignment!(assignment.id) == assignment
    end

    test "create_assignment/1 with valid data creates a assignment" do
      valid_attrs = %{description: "some description", name: "some name"}

      assert {:ok, %Assignment{} = assignment} = Development.create_assignment(valid_attrs)
      assert assignment.description == "some description"
      assert assignment.name == "some name"
    end

    test "create_assignment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Development.create_assignment(@invalid_attrs)
    end

    test "update_assignment/2 with valid data updates the assignment" do
      assignment = assignment_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name"}

      assert {:ok, %Assignment{} = assignment} = Development.update_assignment(assignment, update_attrs)
      assert assignment.description == "some updated description"
      assert assignment.name == "some updated name"
    end

    test "update_assignment/2 with invalid data returns error changeset" do
      assignment = assignment_fixture()
      assert {:error, %Ecto.Changeset{}} = Development.update_assignment(assignment, @invalid_attrs)
      assert assignment == Development.get_assignment!(assignment.id)
    end

    test "delete_assignment/1 deletes the assignment" do
      assignment = assignment_fixture()
      assert {:ok, %Assignment{}} = Development.delete_assignment(assignment)
      assert_raise Ecto.NoResultsError, fn -> Development.get_assignment!(assignment.id) end
    end

    test "change_assignment/1 returns a assignment changeset" do
      assignment = assignment_fixture()
      assert %Ecto.Changeset{} = Development.change_assignment(assignment)
    end
  end
end
