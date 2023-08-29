defmodule ResumaiEx.FileUtils do
  @moduledoc """
  Loads the yaml files in this directory that define workflows
  """

  @workflow_path "/lib/resumai_ex/workflows"

  def load_workflows do
    with {:ok, current_working_directory} <- File.cwd(),
         {:ok, path_to_files} <- get_path(current_working_directory),
         {:ok, files_list} = File.ls(path_to_files) do
      {:ok, files_list}
    end
  end

  defp get_path(current_working_directory) do
    {:ok, Path.join(current_working_directory, @workflow_path)}
  end
end
