defmodule ResumaiExWeb.Resolvers.Workflow do
  @list_all_workflows [
    %{
      :name => "Home",
      :title => "Welcome!",
      :screens => [
        %{
          :name => "Home Screen",
          :components => [
            %{
              :type => "Button",
              :text => "Select a workflow"
            }
          ]
        }
      ]
    },
    %{
      :name => "Create User",
      :title => "Create a New User",
      :screens => [
        %{
          :name => "Create User Screen",
          :components => [
            %{
              :type => "Button",
              :text => "Next"
            },
            %{
              :type => "Input"
            }
          ]
        }
      ]
    }
  ]

  def list_all(_parent, _args, _resolution) do
    {:ok, ResumaiEx.Workflow.Base.home()}
  end

  def find(_parent, args, _resolution) do
    name = Enum.find(@list_all_workflows, fn workflow -> workflow[:name] === args[:name] end)
    {:ok, name}
  end
end
