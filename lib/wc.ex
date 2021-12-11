defmodule Wc do
  @moduledoc """
  Documentation for `Wc`.
  """

  def from(file_name) do
    file_name
    |> File.stream!()
    |> Stream.chunk_every(10000)
    |> Stream.flat_map(fn list -> split_to_line(list) end )
    |> Stream.filter(fn word -> String.match?(word, ~r/[a-zA-z\d]/) end)
    |> Enum.count()
  end

  def split_to_line(list) do
    Stream.flat_map(list, fn line -> split_to_words(line) end)
  end

  def split_to_words(line) do
    String.split(line, " ", trim: true)
  end
end
