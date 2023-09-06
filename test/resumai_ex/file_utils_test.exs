defmodule ResumaiEx.FileUtilsTest do
  use ExUnit.Case
  alias ResumaiEx.FileUtils

  describe("workflow_files_path/1") do
    test("is defined") do
      output = FileUtils.workflow_files_path("current_working_directory")
      assert output
    end

    test("returns the path to the workflows directory") do
      {status, result} = FileUtils.workflow_files_path("current_working_directory")
      assert result == "current_working_directory/lib/resumai_ex/workflows"
      assert status == :ok
    end
  end
end
