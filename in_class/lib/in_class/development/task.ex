defmodule InClass.Development.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias InClass.Development.Assignment
  alias InClass.Company.Developer

  schema "tasks" do
    field :area, :string
    field :due_date, :string
    field :name, :string
    field :status, :string

    has_many(:assignments, Assignment)
    many_to_many(:developers, Developer, join_through: Assignment)

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :due_date, :area, :status])
    |> validate_required([:name, :due_date, :area, :status])
  end
end
