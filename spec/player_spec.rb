require "rspec"
require "player"

describe Player do
    subject(:player) { Player.new("white") }

    context "when getting the Player's color from user" do
        describe "#get_player_color" do
            it "assigns the correct color when Player 1 has already chosen their color" do
                expect(player.get_player_color("white")).to eq("black")
            end
        end
    end

end