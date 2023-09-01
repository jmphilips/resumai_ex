defmodule ResumaiEx.Otp.WorkflowAgent do
  use Agent
  alias ResumaiEx.Workflows

  @doc """
  Starts the Agent responsible for storing workflows in memory.
  """
  def start_link() do
    with {:ok, initial_values} <- Workflows.load_and_build() do
      Agent.start_link(fn -> initial_values end, name: __MODULE__)
    end
  end

  @doc """
  Returns all of theh workflows available in memory.
  """
  def all do
    Agent.get(__MODULE__, & &1)
  end

  @doc """
  Finds a workflow by name and returns the full workflow.
  """
  def find_by_name(name) do
    Agent.get(__MODULE__, fn workflows ->
      case Workflows.find_by_name(workflows, name) do
        {:ok, workflow} -> workflow
        {:error, error} -> error
      end
    end)
  end
end
