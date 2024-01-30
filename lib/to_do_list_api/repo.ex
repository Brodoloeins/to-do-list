defmodule ToDoListApi.Repo do
  use Ecto.Repo,
    otp_app: :to_do_list_api,
    adapter: Ecto.Adapters.Postgres
end
