defmodule SophosApp.Math do
    def sum(a,b)do
        a + b
    end
    
    def mcd(a, 0), do: a
    def mcd(a,b), do: mcd(b, rem(a,b))
end

defmodule SophosApp.Geometry.Rectangle do
    def area(a,b), do: a * b
end