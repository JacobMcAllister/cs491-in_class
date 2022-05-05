defmodule InClass.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :due_date, :string
      add :area, :string
      add :status, :string

      timestamps()
    end
  end
end
