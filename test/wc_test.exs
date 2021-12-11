defmodule WcTest do
  use ExUnit.Case

  test "count words from file" do
    assert Wc.from("test/fixtures/lorem_ipsum.txt") == 140060
  end
end
