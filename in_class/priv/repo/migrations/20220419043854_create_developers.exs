defmodule InClass.Repo.Migrations.CreateDevelopers do
  use Ecto.Migration

  def change do
    create table(:developers) do
      add :last_name, :string
      add :first_name, :string
      add :email, :string
      add :expertise, :string

      timestamps()
    end
  end
end
