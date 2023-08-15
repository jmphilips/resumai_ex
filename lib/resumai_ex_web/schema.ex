defmodule ResumeaiExWeb.Schema do
  use Absinthe.Schema
  import_types(ResumaiExWeb.Schema.UserTypes)
  alias ResumaiExWeb.Resolvers

  query do
    @desc "Get all users"
    field :users, list_of(:user) do
      resolve(&Resolvers.User.list_all/3)
    end
  end
end
