defmodule ResumaiEx.Workflow do
  @moduledoc """
  Base for Workflows
  """
  alias ResumaiEx.{Workflow, Screen}
  defstruct [:name, :id, screens: [], errors: []]

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
end
