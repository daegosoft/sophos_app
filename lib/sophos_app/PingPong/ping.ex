defmodule SophosApp.Ping do
    def ping do
        receive do
            {sender, :pong} -> 
            IO.puts "Pong"
            :timer.sleep(2000)
            send sender, {self(), :ping}
        end
        ping()
    end
end