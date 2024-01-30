defmodule ToDoListApi.Users.Get do
  alias Ecto.UUID
  alias ToDoListApi.{Users, Repo}

  def call(id) do
    id
    |> UUID.cast()
    |> handle_response()
  end

  defp handle_response(:error) do
    {:error, "invalid UUID"}
  end

  defp handle_response({:ok, uuid}) do
    case Repo.get(Users, uuid) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
