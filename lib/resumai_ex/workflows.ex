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
    FileUtils.get_workflow_filenames()
    |> yaml_mapper()
  end

  def yaml_mapper({:ok, file_paths_list}) do
    {:ok,
     Enum.map(file_paths_list, fn file_path ->
       case YamlElixir.read_from_file(file_path) do
         {:ok, yaml} -> yaml
         {:error, error} -> error
       end
     end)}
  end
end
