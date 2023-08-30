defmodule ResumaiEx.Workflow.FileUtilsTest do
  use ExUnit.Case
  alias ResumaiEx.FileUtils

  test("get_workflow_filenames/0 is defined") do
    output = FileUtils.get_workflow_filenames()
    assert output
  end

  test("get_workflow_filenames/0 returns the files from the workflows directory") do
    output = FileUtils.get_workflow_filenames()

    assert output ==
             {:ok,
              [
                "/Users/bender/bender/software/source/resumai_ex/lib/resumai_ex/workflows/test.yaml"
              ]}
  end
end
