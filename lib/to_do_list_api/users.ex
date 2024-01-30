defmodule ToDoListApi.Users do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  @fields [:email, :name, :password]

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:password, min: 6)
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/@/)
    |>unique_constraint([:email])
  end
end


#alias ToDoListApi.Users
#alias ToDoListApi.Repo
#params=%{name: "Joao", email: "jfdc@sadfg.com", password: "2341245124"}
#params |> Users.changeset() |> Repo.insert()

#docker exec -it 41b6cbf05467  psql -U postgres -d postgres -c "DROP DATABASE  to_do_list_api_dev;"
