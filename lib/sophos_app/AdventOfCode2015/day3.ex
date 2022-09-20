defmodule SophosApp.AdventOfCode.Day3 do
    import String, only: [split: 3]
    def first_star(list) do
        list
        |> split("", trim: true)
        |> moving()
        |> Enum.scan(fn ([a, b], [c, d]) -> [a+b, b+d] end)
        |> IO.inspect
        # |> Enum.uniq()
        # |> Enum.count()
    end

    defp moving(list) do
        Enum.map(list, fn 
            "^" -> [0,1]
            "v" -> [0,-1]
            ">" -> [1,0]
            "<" -> [-1,0]
        end)
    end

    def second_star() do
    end
end