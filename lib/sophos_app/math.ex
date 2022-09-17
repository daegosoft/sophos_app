defmodule SophosApp.Math do
    @moduledoc """
    Implementación básica del módulo de matemáticas de Sophos
    """
    @pi 3.1415

    @doc """
    Suma dos números cualesquiera
    """
    def sum(a,b)do
        a + b
    end
    
    @doc """
    Calcula el Máximo omún Divisor
    """
    def mcd(a, 0), do: a
    def mcd(a,b), do: mcd(b, rem(a,b))

    def kind(n) when n < 0, do: :neagtive
    def kind(0), do: :zero
    def kind(n) when n > 0, do: :positive
end

# def circunferencia(r), do: 2 * r * @pi

defmodule SophosApp.Geometry.Rectangle do
    def area(a), do: area(a, a)
    def area(a, b), do: a * b
end