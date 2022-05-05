defmodule InClassWeb.AssignmentController do
  use InClassWeb, :controller

  alias InClass.Repo
  alias InClass.Development
  alias InClass.Development.Assignment
  alias InClass.Company

  def index(conn, _params) do
    assignments = Development.list_assignments()
    render(conn, "index.html", assignments: assignments)
  end

  def new(conn, _params) do
    changeset = Development.change_assignment(%Assignment{})
    developers = Company.list_developers()
    tasks = Development.list_tasks()
    render(conn, "new.html", changeset: changeset, tasks: tasks, developers: developers)
  end

  def create(conn, %{"assignment" => assignment_params}) do
    case Development.create_assignment(assignment_params) do
      {:ok, assignment} ->
        conn
        |> put_flash(:info, "Assignment created successfully.")
        |> redirect(to: Routes.assignment_path(conn, :show, assignment))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    assignment = Development.get_assignment!(id)
    render(conn, "show.html", assignment: assignment)
  end

  def edit(conn, %{"id" => id}) do
    assignment = Development.get_assignment!(id)
    developers = Company.list_developers()
    tasks = Development.list_tasks()
    changeset = Development.change_assignment(assignment)
    render(conn, "edit.html", assignment: assignment, changeset: changeset, tasks: tasks, developers: developers)
  end

  def update(conn, %{"id" => id, "assignment" => assignment_params}) do
    assignment = Development.get_assignment!(id)

    case Development.update_assignment(assignment, assignment_params) do
      {:ok, assignment} ->
        conn
        |> put_flash(:info, "Assignment updated successfully.")
        |> redirect(to: Routes.assignment_path(conn, :show, assignment))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", assignment: assignment, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    assignment = Development.get_assignment!(id)
    {:ok, _assignment} = Development.delete_assignment(assignment)

    conn
    |> put_flash(:info, "Assignment deleted successfully.")
    |> redirect(to: Routes.assignment_path(conn, :index))
  end
end
