defmodule SophosApp.FibonacciServer do
    alias SophosApp.Fibonacci

    def handle_message({:sequence, n}, caller) do
        result = Fibonacci.sequence(n)
        send(caller, {:fibonacci, n, result})
        # handle_message(caller)
    end

    def handle_message({:status}, caller) do
        send(caller, {:ok, caller})
        # handle_message(caller)
    end

        # # receive do
        #     {:sequence, n} ->

        #     {:status} ->

        #     # {:exit,  reason} ->
        #     #     IO.puts("bye for #{inspect(reason)}")
            
            # _message -> IO.puts("Bad operation")
            # handle_message(caller)
            # after 1500 ->pid  IO.puts("Se acabo")
        # end
    end
end