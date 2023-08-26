defmodule ResumaiEx.WorkflowTest do
  @moduledoc """
  Test for base workflows
  """
  use ExUnit.Case
  alias ResumaiEx.Workflow

  test("#all returns a tuple with :ok status") do
    {status, _workflows} = Workflow.all()
    assert status == :ok
  end

  test("#all returns a tuple with a list of workflows") do
    {_status, workflows} = Workflow.all()
    assert workflows == []
  end
end
