require "rspec"
require "bishop"

describe Bishop do
    subject(:bishop) { Bishop.new("white") }

    context "when placing the Bishop on the board to start the game" do
        describe "#set_location" do
            it "returns the proper location array for a White Bishop 1" do
                expect(bishop.set_location(1, "white")).to eq([1, 3])
            end

            it "returns the proper location array for a White Bishop 2" do
                expect(bishop.set_location(2, "white")).to eq([1, 6])
            end

            it "returns the proper location array for a Black Bishop 1" do
                expect(bishop.set_location(1, "black")).to eq([8, 3])
            end

            it "returns the proper location array for a Black Bishop 2" do
                expect(bishop.set_location(2, "black")).to eq([8, 6])
            end
        end
    end

    context "when setting the unicode to be displayed" do
        describe "#set_unicode_value" do
            it "returns the correct unicode value for a White Bishop" do
                expect(bishop.set_unicode_value("white")).to eq("\u2657")
            end

            it "returns the correct unicode value for a Black Bishop"
                expect(bishop.set_unicode_value("black")).to eq("\u265d")
            end
        end
    end
end