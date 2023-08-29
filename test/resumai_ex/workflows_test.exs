defmodule ResumaiEx.WorkflowsTest do
  use ExUnit.Case
  alias ResumaiEx.Workflows

  test("load_and_build/0 is defined") do
    output = Workflows.load_and_build()
    assert output
  end

  test("load_and_build/0 returns a result tuple with status :ok") do
    {status, result} = Workflows.load_and_build()
    assert status == :ok
  end
end
