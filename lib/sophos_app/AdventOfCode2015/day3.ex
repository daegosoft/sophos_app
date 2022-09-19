defmodule SophosApp.AdventOfCode.Day3 do
    import String, only: [split: 3]
    def first_star(list) do
        list
        |> split("", trim: true)
        |> moving()
        |> position()
        |> Enum.uniq()
        |> Enum.count()
    end

    defp moving(list) do
        Enum.map(list, fn 
            "" -> [0,0]
            "^" -> [0,1]
            "v" -> [0,-1]
            ">" -> [1,0]
            "<" -> [-1,0]
        end)
    end

    defp position(r) do
        Enum.scan(r, fn ([a, b], [c, d]) -> [a+b, b+d] end)
    end

    def second_star() do
    end
end