defmodule SophosApp.AdventOfCode.Day1 do
    import String, only: [split: 3, codepoints: 1]

    def first_star(list) do
        list
        |> split("", trim: true)
        |> transform()
        |> Enum.reduce(fn n, acc -> n + acc end)
    end

    defp transform(list) do
        Enum.map(list, fn 
            "(" -> 1
            ")" -> -1 
            end)
    end

    def second_star(list) do
        list
        |> split("", trim: true)
        |> transform()
        |> Enum.scan(&(&1 + &2))
        |> Enum.find_index(fn p -> p == -1 end)
        |> position()
        |> IO.puts
    end

    defp position(e), do: e + 1
end