defmodule GamificationWeb.ErrorJSONTest do
  use GamificationWeb.ConnCase, async: true

  test "renders 404" do
    assert GamificationWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert GamificationWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
