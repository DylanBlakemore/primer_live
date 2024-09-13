defmodule PrimerLive.TestComponents.AvatarTest do
  use ExUnit.Case
  use PrimerLive
  import PrimerLive.Helpers.TestHelpers

  import Phoenix.Component
  import Phoenix.LiveViewTest

  test "Without size attribute" do
    assigns = %{}

    assert rendered_to_string(~H"""
           <.avatar src="user.jpg" />
           """)
           |> format_html() ==
             """
             <img class="avatar avatar-3" src="user.jpg" />
             """
             |> format_html()
  rescue
    e in ExUnit.AssertionError ->
      %{expr: {:assert, [line: line], _}} = e
      to_file(e.left, __ENV__.file, line + 2)
      reraise e, __STACKTRACE__
  end

  test "Attribute: size" do
    assigns = %{}

    assert rendered_to_string(~H"""
           <.avatar src="user.jpg" size={1} />
           <.avatar src="user.jpg" size="2" />
           <.avatar src="user.jpg" size={3} />
           <.avatar src="user.jpg" size={4} />
           <.avatar src="user.jpg" size={5} />
           <.avatar src="user.jpg" size={6} />
           <.avatar src="user.jpg" size={7} />
           <.avatar src="user.jpg" size={8} />
           """)
           |> format_html() ==
             """
             <img class="avatar avatar-1" src="user.jpg" />
             <img class="avatar avatar-2" src="user.jpg" />
             <img class="avatar avatar-3" src="user.jpg" />
             <img class="avatar avatar-4" src="user.jpg" />
             <img class="avatar avatar-5" src="user.jpg" />
             <img class="avatar avatar-6" src="user.jpg" />
             <img class="avatar avatar-7" src="user.jpg" />
             <img class="avatar avatar-8" src="user.jpg" />
             """
             |> format_html()
  rescue
    e in ExUnit.AssertionError ->
      %{expr: {:assert, [line: line], _}} = e
      to_file(e.left, __ENV__.file, line + 2)
      reraise e, __STACKTRACE__
  end

  test "Attribute: size (unsupported values)" do
    assigns = %{}

    assert rendered_to_string(~H"""
           <.avatar src="user.jpg" size={nil} />
           <.avatar src="user.jpg" size="test" />
           <.avatar src="user.jpg" size={0} />
           <.avatar src="user.jpg" size={9} />
           <.avatar src="user.jpg" size="9" />
           """)
           |> format_html() ==
             """
             <img class="avatar avatar-3" src="user.jpg" />
             <img class="avatar avatar-3" src="user.jpg" />
             <img class="avatar avatar-3" src="user.jpg" />
             <img class="avatar avatar-3" src="user.jpg" />
             <img class="avatar avatar-3" src="user.jpg" />
             """
             |> format_html()
  rescue
    e in ExUnit.AssertionError ->
      %{expr: {:assert, [line: line], _}} = e
      to_file(e.left, __ENV__.file, line + 2)
      reraise e, __STACKTRACE__
  end

  test "Attribute: size plus width or height" do
    assigns = %{}

    assert rendered_to_string(~H"""
           <.avatar src="user.jpg" width="40" size={1} />
           <.avatar src="user.jpg" height="40" size={1} />
           <.avatar src="user.jpg" width="40" height="40" />
           """)
           |> format_html() ==
             """
             <img class="avatar" src="user.jpg" width="40" />
             <img class="avatar" height="40" src="user.jpg" />
             <img class="avatar" height="40" src="user.jpg" width="40" />
             """
             |> format_html()
  rescue
    e in ExUnit.AssertionError ->
      %{expr: {:assert, [line: line], _}} = e
      to_file(e.left, __ENV__.file, line + 2)
      reraise e, __STACKTRACE__
  end

  test "Attribute: is_round" do
    assigns = %{}

    assert rendered_to_string(~H"""
           <.avatar src="user.jpg" is_round />
           """)
           |> format_html() ==
             """
             <img class="avatar avatar-3 pl-avatar--round" src="user.jpg" />
             """
             |> format_html()
  rescue
    e in ExUnit.AssertionError ->
      %{expr: {:assert, [line: line], _}} = e
      to_file(e.left, __ENV__.file, line + 2)
      reraise e, __STACKTRACE__
  end

  test "Class" do
    assigns = %{}

    assert rendered_to_string(~H"""
           <.avatar src="user.jpg" class="my-avatar" />
           """)
           |> format_html() ==
             """
             <img class="avatar avatar-3 my-avatar" src="user.jpg" />
             """
             |> format_html()
  rescue
    e in ExUnit.AssertionError ->
      %{expr: {:assert, [line: line], _}} = e
      to_file(e.left, __ENV__.file, line + 2)
      reraise e, __STACKTRACE__
  end

  test "Attribute: style" do
    assigns = %{}

    assert rendered_to_string(~H"""
           <.avatar src="user.jpg" style="border: 1px solid red;" />
           """)
           |> format_html() ==
             """
             <img class="avatar avatar-3" src="user.jpg" style="border: 1px solid red;" />
             """
             |> format_html()
  rescue
    e in ExUnit.AssertionError ->
      %{expr: {:assert, [line: line], _}} = e
      to_file(e.left, __ENV__.file, line + 2)
      reraise e, __STACKTRACE__
  end
end
