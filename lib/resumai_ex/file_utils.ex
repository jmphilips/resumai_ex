defmodule ResumaiEx.FileUtils do
  @moduledoc """
  This module provides utility functions for working with workflow YAML files.

  Workflows are stored in the `lib/resumai_ex/workflows` directory.
  """

  @workflow_path "/lib/resumai_ex/workflows"

  def list_workflow_files do
    with {:ok, current_working_directory} <- File.cwd(),
         {:ok, path_to_files} <- workflow_files_path(current_working_directory),
         {:ok, files_list} <- File.ls(path_to_files),
         {:ok, absolute_file_paths} <- expand_to_absolute_path(files_list, path_to_files) do
      {:ok, absolute_file_paths}
    end
  end

  def workflow_files_path(current_working_directory) do
    {:ok, Path.join(current_working_directory, @workflow_path)}
  end

  defp expand_to_absolute_path(file_names_list, path_to_files) do
    {:ok, Enum.map(file_names_list, fn file_name -> Path.join(path_to_files, file_name) end)}
  end
end
