defmodule ResumeaiExWeb.Schema do
  use Absinthe.Schema
  alias ResumaiExWeb.Types
  alias ResumaiExWeb.Resolvers

  import_types(Types.User)
  import_types(Types.Experience)
  import_types(Types.Authentication)
  import_types(Types.Workflow)

  query do
    @desc "Get all users"
    field :users, list_of(:user) do
      resolve(&Resolvers.User.list_all/3)
    end

    @desc "Get the count"
    field :experience, :experience do
      resolve(&Resolvers.Experience.count/3)
    end

    @desc "List all workflows"
    field :workflows, list_of(:workflow) do
      resolve(&Resolvers.Workflow.list_all/3)
    end

    @desc "Find a workflow"
    field :workflow, :workflow do
      arg(:name, :string)
      arg(:id, :integer)
      resolve(&Resolvers.Workflow.find/3)
    end
  end

  mutation do
    @desc "Add user"
    field :create_user, :user do
      arg(:first_name, non_null(:string))
      arg(:last_name, non_null(:string))
      arg(:phone_number, non_null(:string))
      arg(:city, non_null(:string))
      arg(:state, non_null(:string))
      arg(:country, non_null(:string))
      arg(:linked_in, non_null(:string))

      resolve(&Resolvers.User.create/3)
    end

    @desc "Authenticate Client"
    field :authenticate, :authentication do
      arg(:client, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&Resolvers.Authentication.create/3)
    end
  end
end
