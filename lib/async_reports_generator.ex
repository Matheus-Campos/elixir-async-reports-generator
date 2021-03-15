defmodule AsyncReportsGenerator do
  alias AsyncReportsGenerator.Parser

  @months [
    "janeiro",
    "fevereiro",
    "março",
    "abril",
    "maio",
    "junho",
    "julho",
    "agosto",
    "setembro",
    "outubro",
    "novembro",
    "dezembro"
  ]

  def generate(file_names) do
    file_names
    |> Task.async_stream(fn file_name -> build(file_name) end)
    |> Enum.reduce(initial_report(), fn {:ok, report}, acc -> merge_maps(acc, report) end)
  end

  defp build(file_name) do
    file_name
    |> Parser.parse_file()
    |> Enum.reduce(initial_report(), fn line, report -> sum_values(line, report) end)
  end

  defp sum_values([person_name, hours, _day, month, year], %{
         "all_hours" => all_hours,
         "hours_per_month" => hours_per_month,
         "hours_per_year" => hours_per_year
       }) do
    all_hours = merge_maps(all_hours, %{person_name => hours})
    month_key = Enum.at(@months, month - 1)
    hours_per_month = merge_maps(hours_per_month, %{person_name => %{month_key => hours}})
    hours_per_year = merge_maps(hours_per_year, %{person_name => %{year => hours}})

    build_report(all_hours, hours_per_month, hours_per_year)
  end

  defp merge_maps(map1, map2) do
    Map.merge(map1, map2, fn _key, value1, value2 ->
      cond do
        is_map(value1) and is_map(value2) -> merge_maps(value1, value2)
        is_integer(value1) and is_integer(value2) -> value1 + value2
      end
    end)
  end

  defp initial_report do
    build_report(%{}, %{}, %{})
  end

  defp build_report(all_hours, hours_per_month, hours_per_year) do
    %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
  end
end
