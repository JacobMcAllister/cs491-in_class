defmodule InClass.Development.Assignment do
  use Ecto.Schema
  import Ecto.Changeset
  alias InClass.Company.Developer

  schema "assignments" do
    field :description, :string
    field :name, :string

    belongs_to(:developer, Developer)
    belongs_to(:task, Task)

    timestamps()
  end

  @doc false
  def changeset(assignment, attrs) do
    assignment
    |> cast(attrs, [:name, :description, :developer_id, :task_id])
    |> validate_required([:name, :description, :developer_id, :task_id])
  end
end
