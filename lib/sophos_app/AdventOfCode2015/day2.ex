defmodule SophosApp.AdventOfCode.Day2 do
    import String, only: [split: 3, to_integer: 1]
    def first_star(list) do
        list
        |> split("\n", trim: true)
        |> Enum.map(fn x -> split(x, "x", trim: true)end)
        |> Enum.map(fn n -> Enum.map(n,fn n ->to_integer(n) end)end)
        |> Enum.map( fn m -> calculate(m) end)
        |> Enum.sum()
        |> IO.puts
    end

    defp calculate([l,w,h]) do
        calc = [2*l*w + 2*w*h + 2*h*l]
        extra = Enum.min([l*w,w*h,h*l])
        Enum.sum(calc) + extra
    end
end