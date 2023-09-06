defmodule ResumaiEx.Workflow do
  @moduledoc """
  Base for Workflows
  """
  alias ResumaiEx.{Workflow, Screen, Screens}
  defstruct [:id, :name, :title, screens: []]

  def new, do: {:ok, %Workflow{}}

  def build({:ok, workflow}, %{name: name, id: id}) do
    {:ok, %Workflow{workflow | name: name, id: id}}
  end

  def build(%{name: name, id: id} = args) do
    new() |> build(args)
  end

  def add_screen({:ok, %Workflow{screens: screens} = workflow}, %Screen{} = screen) do
    {:ok, %Workflow{workflow | screens: [screen | screens]}}
  end

  @spec build_from_yaml(any) :: %Workflow{}
  def build_from_yaml(%{"workflow" => %{"name" => name, "id" => id, "screens" => screens}}) do
    # built_screens = Screens.build_from_yaml_files(screens)
    # IO.inspect(built_screens)
    %Workflow{name: name, id: id, screens: screens}
  end
end
