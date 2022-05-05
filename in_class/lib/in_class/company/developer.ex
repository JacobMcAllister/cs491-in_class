defmodule InClass.Company.Developer do
  use Ecto.Schema
  import Ecto.Changeset
  alias InClass.Development.{Assignment, Task}

  schema "developers" do
    field :email, :string
    field :expertise, :string
    field :first_name, :string
    field :last_name, :string

    has_many(:assignments, Assignment)
    many_to_many(:tasks, Task, join_through: Assignment)

    timestamps()
  end

  @doc false
  def changeset(developer, attrs) do
    developer
    |> cast(attrs, [:last_name, :first_name, :email, :expertise])
    |> validate_required([:last_name, :first_name, :email, :expertise])
  end
end
