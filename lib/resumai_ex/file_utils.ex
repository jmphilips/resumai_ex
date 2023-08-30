defmodule ResumaiEx.FileUtils do
  @moduledoc """
  This module provides utility functions for working with workflow YAML files.
  """

  @workflow_path "/lib/resumai_ex/workflows"

  def get_workflow_filenames do
    with {:ok, current_working_directory} <- File.cwd(),
         {:ok, path_to_files} <- get_path(current_working_directory),
         {:ok, files_list} <- File.ls(path_to_files),
         {:ok, absolute_file_paths} <- build_absolute_path(files_list, path_to_files) do
      {:ok, absolute_file_paths}
    end
  end

  def get_path(current_working_directory) do
    {:ok, Path.join(current_working_directory, @workflow_path)}
  end

  defp build_absolute_path(file_names_list, path_to_files) do
    {:ok, Enum.map(file_names_list, fn file_name -> Path.join(path_to_files, file_name) end)}
  end
end
