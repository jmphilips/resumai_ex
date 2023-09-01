defmodule ResumaiEx.WorkflowTest do
  use ExUnit.Case

  alias ResumaiEx.{Workflow, Screen}

  @workflow_name "Workflow Name"
  @workflow_id 1
  @screen_name "Screen Name"

  @workflow_args %{
    id: @workflow_id,
    name: @workflow_name
  }

  @new_workflow {
    :ok,
    %Workflow{}
  }

  @new_screen %Screen{
    name: "New Screen"
  }

  test("#new/0 is defined") do
    output = Workflow.new()
    assert output
  end

  test("#new/0 returns a result tuple with :ok") do
    {status, _result} = Workflow.new()
    assert status == :ok
  end

  test("#new/0 returns a result tuple with an empty %Workflow{}") do
    {_status, result} = Workflow.new()
    assert result == %Workflow{}
  end

  test("#build/1") do
    output = Workflow.build(@workflow_args)
    assert output
  end

  test("#build/2 takes a result tuple") do
    arguments = {:ok, %Workflow{}}
  end

  test("#build/2 takes a string as an argument") do
    output = Workflow.build(@new_workflow, @workflow_args)
    assert output
  end

  test("#build/2 returns a result tuple") do
    {status, _result} = Workflow.build(@new_workflow, @workflow_args)
    assert status == :ok
  end

  test("#build/2 returns a %Workflow{}") do
    {_status, result} = Workflow.build(@new_workflow, @workflow_args)
    assert result == %Workflow{name: @workflow_name, id: @workflow_id}
  end

  test("#add_screen/2 is defined") do
    workflow = %Workflow{
      name: @workflow_name
    }

    assert Workflow.add_screen({:ok, workflow}, @new_screen)
  end

  test("#add_screen/2 returns a result tuple") do
    workflow = %Workflow{
      name: @workflow_name
    }

    {status, _result} = Workflow.add_screen({:ok, workflow}, @new_screen)
    assert status == :ok
  end

  test("#add_screen/2 adds a screen to the result tuple") do
    workflow = %Workflow{
      name: @workflow_name
    }

    {_status, result} = Workflow.add_screen({:ok, workflow}, @new_screen)
    assert result == %Workflow{name: @workflow_name, screens: [@new_screen]}
  end

  describe("build_from_yaml/1") do
    test("returns a result tuple") do
      input = %{"workflow" => %{"name" => "Home", "id" => 1, "screens" => []}}
      output = Workflow.build_from_yaml(input)
      assert output == %Workflow{name: "Home", id: 1, screens: []}
    end
  end
end
