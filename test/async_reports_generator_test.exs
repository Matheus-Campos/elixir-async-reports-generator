defmodule AsyncReportsGeneratorTest do
  use ExUnit.Case

  describe "generate/1" do
    test "when a list of file names is provided, generate a report" do
      file_names = [
        "resources/test/part_1.csv",
        "resources/test/part_2.csv",
        "resources/test/part_3.csv"
      ]

      response = AsyncReportsGenerator.generate(file_names)

      expected_response = %{
        "all_hours" => %{
          "Cleiton" => 38,
          "Daniele" => 21,
          "Danilo" => 29,
          "Diego" => 24,
          "Giuliano" => 21,
          "Jakeliny" => 23,
          "Joseph" => 25,
          "Mayk" => 37,
          "Rafael" => 16,
          "Vinicius" => 21
        },
        "hours_per_month" => %{
          "Cleiton" => %{
            "abril" => 3,
            "agosto" => 2,
            "dezembro" => 9,
            "julho" => 8,
            "junho" => 12,
            "novembro" => 4
          },
          "Daniele" => %{"abril" => 7, "dezembro" => 5, "junho" => 1, "maio" => 8},
          "Danilo" => %{"agosto" => 8, "fevereiro" => 12, "março" => 9},
          "Diego" => %{"abril" => 8, "agosto" => 4, "julho" => 5, "outubro" => 4, "setembro" => 3},
          "Giuliano" => %{"abril" => 1, "fevereiro" => 11, "março" => 3, "outubro" => 6},
          "Jakeliny" => %{
            "agosto" => 3,
            "dezembro" => 5,
            "julho" => 8,
            "março" => 6,
            "novembro" => 1
          },
          "Joseph" => %{"abril" => 7, "junho" => 1, "março" => 15, "novembro" => 2},
          "Mayk" => %{
            "abril" => 2,
            "dezembro" => 5,
            "julho" => 11,
            "maio" => 5,
            "outubro" => 7,
            "setembro" => 7
          },
          "Rafael" => %{"julho" => 5, "junho" => 7, "novembro" => 4},
          "Vinicius" => %{"junho" => 2, "maio" => 2, "outubro" => 7, "setembro" => 10}
        },
        "hours_per_year" => %{
          "Cleiton" => %{"2016" => 5, "2017" => 8, "2018" => 12, "2019" => 3, "2020" => 10},
          "Daniele" => %{"2016" => 10, "2017" => 3, "2018" => 7, "2020" => 1},
          "Danilo" => %{"2016" => 8, "2018" => 6, "2019" => 6, "2020" => 9},
          "Diego" => %{"2016" => 3, "2017" => 4, "2019" => 5, "2020" => 12},
          "Giuliano" => %{"2017" => 12, "2019" => 8, "2020" => 1},
          "Jakeliny" => %{"2017" => 13, "2018" => 1, "2019" => 9},
          "Joseph" => %{"2017" => 4, "2019" => 9, "2020" => 12},
          "Mayk" => %{"2016" => 14, "2017" => 19, "2019" => 4},
          "Rafael" => %{"2016" => 7, "2017" => 4, "2020" => 5},
          "Vinicius" => %{"2016" => 1, "2017" => 9, "2018" => 11}
        }
      }

      assert response == expected_response
    end
  end
end
