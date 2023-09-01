defmodule ResumaiEx.FileUtilsTest do
  use ExUnit.Case
  alias ResumaiEx.FileUtils

  describe("list_workflow_files/0") do
    test("is defined") do
      output = FileUtils.list_workflow_files()
      assert output
    end

    test("returns the files from the workflows directory") do
      output = FileUtils.list_workflow_files()

      assert output ==
               {:ok,
                [
                  "/Users/bender/bender/software/source/resumai_ex/lib/resumai_ex/workflows/home.yaml"
                ]}
    end
  end

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
