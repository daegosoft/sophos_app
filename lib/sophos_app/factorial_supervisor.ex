defmodule SophosApp.FactorialSupervisor do
    use Supervisor
    alias SophosApp.FactorialGenServer

    def start_link(args)do
        Supervisor.start_link(__MODULE__, args)
    end

    def init(_args) do
        children = [FactorialGenServer]
        Supervisor.init(children, strategy: :one_for_one)
    end
end