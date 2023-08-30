defmodule ResumaiEx.WorkflowsTest do
  use ExUnit.Case
  alias ResumaiEx.Workflows

  @test_yaml_path "lib/resumai_ex/workflows/test.yaml"

  describe("load_and_build/0") do
    test("load_and_build/0 is defined") do
      output = Workflows.load_and_build()
      assert output
    end

    test("load_and_build/0 returns a result tuple with status :ok") do
      {status, result} = Workflows.load_and_build()
      assert status == :ok
    end
  end

  describe("yaml_mapper/1") do
    test("is defined") do
      output = Workflows.yaml_mapper(test_yaml_generator())
      assert output
    end

    test("returns a result tuple") do
      {status, result} = Workflows.yaml_mapper(test_yaml_generator())
      assert status == :ok

      assert result == [
               %{
                 "workflow" => %{
                   "name" => "Home",
                   "screens" => %{"screen" => %{"name" => "Home"}}
                 }
               }
             ]
    end
  end

  def test_yaml_generator do
    with {:ok, current_working_directory} <- File.cwd() do
      {:ok, [Path.join(current_working_directory, @test_yaml_path)]}
    end
  end
end
