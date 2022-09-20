defmodule SophosApp.GenericServer do
    def start(module, caller) do
        spawn(module, :handle_message, [caller])
    end
end