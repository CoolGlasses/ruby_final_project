require "rspec"
require "queen"

describe Queen do
    subject(:queen) { Queen.new("white") }

    context "when placing the Queen on the board to start the game" do
        describe "#set_location" do
            it "returns the proper location array for a White Queen" do
                expect(queen.set_location("white")).to eq([1, 4])
            end
            it "returns the proper location array for a Black Queen" do
                expect(queen.set_location("black")).to eq([8, 4])
            end
        end
    end

    context "when setting the unicode to be displayed" do
        describe "#set_unicode_value" do
            it "returns the correct unicode value for a White Queen" do
                expect(queen.set_unicode_value("white")).to eq("\u2655")
            end

            it "returns the correct unicode value for a Black Queen"
                expect(queen.set_unicode_value("black")).to eq("\u265b")
            end
        end
    end
end