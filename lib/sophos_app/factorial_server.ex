defmodule SophosApp.FactorialServer do
    alias SophosApp.Factorial

    def handle_message({:sequence, n}, caller) do
        result = Factorial.of(n)
        send(caller, {:compute, n, result})
    end

    def handle_message({:status}, caller) do
        send(caller, {:ok, caller})
    end
        # receive do
        #      ->
        #         result = Factorial.of(n)
        #         send(caller, {:compute, n, result})
        #         handle_message(caller)

        #     {:status} ->
        #         handle_message(caller)

        #     {:exit,  reason} ->
        #         IO.puts("bye for #{inspect(reason)}")
            
        #     _message -> IO.puts("Bad operation")
        #     handle_message(caller)
        #     # after 1500 ->pid  IO.puts("Se acabo")
        # end
    end
end