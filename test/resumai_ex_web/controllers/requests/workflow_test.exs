defmodule ResumaiExWeb.Requests.WorkflowTest do
  use ResumaiExWeb.ConnCase

  @workflows_query """
    query getWorkflows {
      workflows {
        title
        name
        id
      }
    }
  """

  test "query: workflows", %{conn: conn} do
    conn = post(conn, "/api/", %{"query" => @workflows_query})

    assert json_response(conn, 200) == %{
             "data" => %{
               "workflows" => [
                 %{"id" => "1", "title" => "Welcome!", "name" => "Home"},
                 %{"id" => "2", "title" => "Create a New User", "name" => "Create User"}
               ]
             }
           }
  end

  @workflow_query """
    query getWorkflow($name: String!) {
      workflow(name: $name) {
        title
        name
        id
        screens {
          id
          name
          title
        }
      }
    }
  """

  test "query: workflow", %{conn: conn} do
    conn = post(conn, "/api/", %{"query" => @workflow_query, "variables" => %{name: "Home"}})

    assert json_response(conn, 200) == %{
             "data" => %{
               "workflow" => %{
                 "name" => "Home",
                 "id" => "1",
                 "title" => "Welcome!",
                 "screens" => [
                   %{
                     "id" => "1",
                     "name" => "Home",
                     "title" => "Welcome to Resumai!"
                   }
                 ]
               }
             }
           }
  end
end
