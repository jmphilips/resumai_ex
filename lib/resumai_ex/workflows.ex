defmodule ResumaiEx.Workflows do
  @moduledoc """
  This is the location of all of the workflows that exist.
  """
  alias ResumaiEx.{FileUtils, Workflow}

  def load_and_build do
    FileUtils.list_workflow_files()
    |> load_from_yaml_files()
    |> build_from_yaml_files()
  end

  def load_from_yaml_files({:ok, file_paths_list}) do
    {:ok,
     Enum.map(file_paths_list, fn file_path ->
       case YamlElixir.read_from_file(file_path) do
         {:ok, workflow} -> workflow
         {:error, error} -> error
       end
     end)}
  end

  def build_from_yaml_files({:ok, workflow_list}) do
    {:ok,
     Enum.map(workflow_list, fn workflow ->
       Workflow.build_from_yaml(workflow)
     end)}
  end

  @spec find_by_name([%Workflow{}], String.t()) :: {:ok, %Workflow{}} | {:error, String.t()}
  def find_by_name(workflows, name) do
    case Enum.find(workflows, fn workflow -> workflow["workflow"]["name"] == name end) do
      nil -> {:error, "Workflow with name: #{name} found"}
      workflow -> {:ok, workflow}
    end
  end
end
