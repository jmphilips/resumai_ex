defmodule ResumaiExWeb.Resolvers.Workflow do
  alias ResumaiEx.Workflows
  alias ResumaiEx.Otp.WorkflowAgent

  @list_all_workflows [
    %{
      :name => "Home",
      :title => "Welcome!",
      :id => 1,
      :screens => [
        ResumaiExWeb.Resolvers.Screen.home()
      ]
    },
    %{
      :name => "Create User",
      :title => "Create a New User",
      :id => 2,
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
    case WorkflowAgent.all() do
      {:ok, workflows} -> {:ok, workflows}
      {:error, error} -> {:error, error}
    end
  end

  def find(_parent, %{name: name}, _resolution) do
    case WorkflowAgent.find_by_name(name) do
      {:ok, workflow} -> {:ok, workflow}
      {:error, error} -> {:error, error}
    end
  end

  def find(_parent, %{id: id}, _resolution) do
    case WorkflowAgent.find_by_id(id) do
      {:ok, workflow} -> {:ok, workflow}
      {:error, error} -> {:error, error}
    end
  end
end
