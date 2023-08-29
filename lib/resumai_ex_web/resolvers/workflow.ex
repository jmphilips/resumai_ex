defmodule ResumaiExWeb.Resolvers.Workflow do
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
    {:ok, @list_all_workflows}
  end

  def find(_parent, args, _resolution) do
    name = Enum.find(@list_all_workflows, fn workflow -> workflow[:name] === args[:name] end)
    {:ok, name}
  end
end
