defmodule ResumaiEx.Workflows do
  @moduledoc """
  This is the location of all of the workflows that exist.
  """
  alias ResumaiEx.{Workflow, Screens, FileUtils}

  @doc """
  Workflow.new()
  |> Workflow.build()
  |> Workflow.add_screen(%Screen{name: "Home"})
  """
  def home do
    Workflow.new()
    |> Workflow.build(%{name: "Home", id: 1})
    |> Workflow.add_screen(Screens.home())
  end

  def load_and_build do
    FileUtils.load_workflows()
  end
end
