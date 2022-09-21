defmodule SophosApp.Pong do
    def pong do
        receive do
            {sender, :ping} -> 
            IO.puts "Ping"
            :timer.sleep(2000)
            send sender, {self(), :pong}
            pong()
        end
    end
end