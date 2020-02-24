require "rspec"
require "knight"

describe Knight do
    subject(:knight) { Knight.new("white") }

    context "when placing the Knight on the board to start the game" do
        describe "#set_location" do
            it "returns the proper location array for a White Knight 1" do
                expect(knight.set_location(1, "white")).to eq([1, 2])
            end

            it "returns the proper location array for a White Knight 2" do
                expect(knight.set_location(2, "white")).to eq([1, 7])
            end

            it "returns the proper location array for a Black Knight 1" do
                expect(knight.set_location(1, "black")).to eq([8, 2])
            end

            it "returns the proper location array for a Black Knight 2" do
                expect(knight.set_location(2, "black")).to eq([8, 7])
            end
        end
    end

    context "when setting the unicode to be displayed" do
        describe "#set_unicode_value" do
            it "returns the correct unicode value for a White Knight" do
                expect(knight.set_unicode_value("white")).to eq("\u2656")
            end

            it "returns the correct unicode value for a Black Knight"
                expect(knight.set_unicode_value("black")).to eq("\u265c")
            end
        end
    end
end
