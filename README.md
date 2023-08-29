# ResumaiEx

## What is it?

This application is built using Elixir, Phoenix, Absinthe, Graphql, and SQLite that takes Workflows or User Flows and creates Graphql Queries and mutations that are then parsed and displayed by consuming clients.

## Idea

The Big idea behind this is to provide a "Backend for a Front End" that performs does the following.

1. Defines Workflows or Userflows for end users.
2. Builds Workflows from composable Screens as experienced by the end user.
3. Builds Screens from composable components as rendered by consuming clients.


## Key Definitions

**Workflow:**

Defintion: An end to end user experience.

Example: Creating a new user.

**Screen:**

Definition: A single page or view displayed to a user.

Exammple: A page that asks for your first name, last name, and email address.

**Component:**

Definition: An element on a page or view.

Example: A text input.


## Technical Details

### Workflow Definitions

Workflows are defined inside of YAML files located in `./lib/resumai_ex/workflows`


To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

