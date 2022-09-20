defmodule SophosApp.FibonacciServer do
    alias SophosApp.Fibonacci
    def loop() do
        receive do
            {:sequence, caller, n} ->
                result = Fibonacci.sequence(n)
                send(caller, {:fibonacci, n, result, {:self, self, :caller, caller}})
                loop()

            {:status, msg} ->
                IO.puts("Running #{inspect(msg)}")
                loop()

            {:exit,  reason} ->
                IO.puts("bye for #{inspect(reason)}")
            
            _message -> IO.puts("Bad operation")
            loop()
            # after 1500 ->pid  IO.puts("Se acabo")
        end
    end
end