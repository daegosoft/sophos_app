defmodule SophosApp.FibonacciGenServer do
    use GenServer
    alias SophosApp.Fibonacci

    def init(_args) do
        {:ok, %{}}
    end

    def handle_call({:sequence, n}, _from, state) do
        result = Fibonacci.sequence(n)
        state
        |> Map.fetch(n)
        |> case do
            {:ok, r} -> r
            :error -> Fibonacci.sequence(n)
        end

        new_state =  Map.put(state, n, result)
        {:reply, result, new_state}
    end

    def handle_call(:status, _from, state) do
        {:reply, state, state}
    end

    # def handle_cast({:sequence, n}, _from, state) do
    #     result = Fibonacci.sequence(n)
    #     {:noreply,  [result | state]}
    # end
end