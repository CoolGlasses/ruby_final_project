require "rspec"
require "castle"

describe Castle do
    subject(:Castle) { Castle.new("white") }

    context "when placing the Castle on the board to start the game" do
        describe "#set_location" do
            it "returns the proper location array for a White Castle 1" do
                expect(castle.set_location(1, "white")).to eq([1, 1])
            end

            it "returns the proper location array for a White Castle 2" do
                expect(castle.set_location(2, "white")).to eq([1, 8])
            end

            it "returns the proper location array for a Black Castle 1" do
                expect(castle.set_location(1, "black")).to eq([8, 1])
            end

            it "returns the proper location array for a Black Castle 2" do
                expect(castle.set_location(2, "black")).to eq([8, 8])
            end
        end
    end

    context "when setting the unicode to be displayed" do
        describe "#set_unicode_value" do
            it "returns the correct unicode value for a White Castle" do
                expect(castle.set_unicode_value("white")).to eq("\u2656")
            end

            it "returns the correct unicode value for a Black Castle"
                expect(castle.set_unicode_value("black")).to eq("\u265c")
            end
        end
    end
end