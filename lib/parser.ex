defmodule AsyncReportsGenerator.Parser do
  def parse_file(file_name) do
    file_name
    |> File.stream!()
    |> Stream.map(fn line -> parse_line(line) end)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(1, &String.to_integer/1)
    |> List.update_at(3, &String.to_integer/1)
  end
end
