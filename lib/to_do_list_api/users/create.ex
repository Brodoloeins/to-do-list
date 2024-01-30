defmodule ToDoListApi.Users.Create do
  alias ToDoListApi.{Users, Repo}

  def call(params) do
    params
    |> Users.changeset()
    |> Repo.insert()
  end
end
