defmodule SophosApp.FactorialServer do
    alias SophosApp.Factorial

    def handle_message(caller) do
        receive do
            {:sequence, caller, n} ->
                result = Factorial.of(n)
                send(caller, {:compute, n, result})
                handle_message(caller)

            {:status, caller} ->
                send(caller, {:ok, caller})
                handle_message(caller)

            {:exit,  reason} ->
                IO.puts("bye for #{inspect(reason)}")
            
            _message -> IO.puts("Bad operation")
            handle_message(caller)
            # after 1500 ->pid  IO.puts("Se acabo")
        end
    end
end