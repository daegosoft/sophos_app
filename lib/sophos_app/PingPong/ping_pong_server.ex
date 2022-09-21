defmodule SophosApp.PingPongServer do
    def start({module, module1}) do
        {spawn(module, :ping, []), spawn(module, :pong, [])}
    end
end