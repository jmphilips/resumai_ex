defmodule ResumaiEx.Workflow.FileUtilsTest do
  use ExUnit.Case
  alias ResumaiEx.FileUtils

  test("load_workflows/0 is defined") do
    output = FileUtils.load_workflows()
    assert output
  end

  test("load_workflows/0 returns the files from the workflows directory") do
    output = FileUtils.load_workflows()
    assert output == {:ok, ["test.yaml"]}
  end
end
