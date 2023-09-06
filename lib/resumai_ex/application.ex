defmodule ResumaiEx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ResumaiExWeb.Telemetry,
      # Start the Ecto repository
      ResumaiEx.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ResumaiEx.PubSub},
      # Start Finch
      {Finch, name: ResumaiEx.Finch},
      # Start the Endpoint (http/https)
      ResumaiExWeb.Endpoint,
      # Start a worker by calling: ResumaiEx.Worker.start_link(arg)
      # {ResumaiEx.Worker, arg}
      {ResumaiEx.Otp.TokenAgent, 0},
      {ResumaiEx.Otp.UserAgent, []},
      {ResumaiEx.Otp.WorkflowAgent, :ok}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ResumaiEx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ResumaiExWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
