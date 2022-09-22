defmodule SophosApp.FactorialGenServer do
    use GenServer

    alias SophosApp.Factorial

    #Client API
    def start_link(_)do
        GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
    end

    def compute(pid, n) do
        GenServer.cast(pid, {:of, n})
    end


    def crash(pid) do
        GenServer.call(pid, :crash)
    end

    def status(pid) do
        GenServer.call(pid, :status)
    end

    #Callbacks
    def init(_args) do
        {:ok, %{}}
    end

    def handle_call(:crash, _from, state) do
        Process.exit(self(), :kill)
        {:reply, 0, state}
    end

    def handle_call({:of, n}, _from, state) when n >= 0 do
        result = compute_of(n, state)

        new_state = Map.put_new(state, n, result)
        {:reply, result, new_state}
    end

    def handle_call(:status, _from, state) do
        {:reply, state, state}
    end

    def handle_cast({:of, n}, state) do
        result = compute_of(n, state)
        new_state = Map.put_new(state, n, result)
        {:noreply, new_state}
    end

    def handle_info(msg, state) do
        IO.inspect(msg)
        {:noreply, state}
    end

    defp compute_of(n, state) do
        state
        |> Map.fetch(n)
        |> case do
            {:ok, r} -> r
            :error -> Factorial.of(n)
        end
    end
end