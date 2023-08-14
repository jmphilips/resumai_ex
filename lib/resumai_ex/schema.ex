defmodule ResumaiEx.Schema do
  @moduledoc false

  use Absinthe.Schema

  @users %{
    "josh" => %{id: "josh", name: "Joshua"},
    "cris" => %{id: "cris", name: "Cristina"}
  }

  query do
    field :user, :user do
      arg(:id, non_null(:id))

      resolve(fn %{id: user_id}, _ ->
        {:ok, @users[user_id]}
      end)
    end
  end
end
