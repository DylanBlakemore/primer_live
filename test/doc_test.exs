defmodule PrimerLiveDocTest do
  @moduledoc false

  use ExUnit.Case
  doctest PrimerLive.Helpers.AttributeHelpers
  doctest PrimerLive.Helpers.ComponentHelpers
  doctest PrimerLive.Helpers.FormHelpers
  doctest PrimerLive.Helpers.SchemaHelpers
  doctest PrimerLive.Theme
  doctest PrimerLive.Component
end
