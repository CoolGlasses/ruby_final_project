require "rspec"
require "pawn"

describe Pawn do
    subject(:pawn) { Pawn.new("white") }

    context "when placing the Pawn on the board to start the game" do
        describe "#set_location" do
            it "returns the proper location array for a White Pawn 1" do
                expect(pawn.set_location(1, "white")).to eq([2, 1])
            end

            it "returns the proper location array for a White Pawn 2" do
                expect(pawn.set_location(2, "white")).to eq([2, 2])
            end

            it "returns the proper location array for a White Pawn 3" do
                expect(pawn.set_location(3, "white")).to eq([2, 3])
            end

            it "returns the proper location array for a White Pawn 4" do
                expect(pawn.set_location(4, "white")).to eq([2, 4])
            end
            
            it "returns the proper location array for a White Pawn 5" do
                expect(pawn.set_location(5, "white")).to eq([2, 5])
            end

            it "returns the proper location array for a White Pawn 6" do
                expect(pawn.set_location(6, "white")).to eq([2, 6])
            end
            
            it "returns the proper location array for a White Pawn 7" do
                expect(pawn.set_location(7, "white")).to eq([2, 7])
            end

            it "returns the proper location array for a White Pawn 8" do
                expect(pawn.set_location(8, "white")).to eq([2, 8])
            end

            it "returns the proper location array for a Black Pawn 1" do
                expect(pawn.set_location(1, "black")).to eq([2, 1])
            end

            it "returns the proper location array for a Black Pawn 2" do
                expect(pawn.set_location(2, "black")).to eq([2, 2])
            end

            it "returns the proper location array for a Black Pawn 3" do
                expect(pawn.set_location(3, "black")).to eq([2, 3])
            end

            it "returns the proper location array for a Black Pawn 4" do
                expect(pawn.set_location(4, "black")).to eq([2, 4])
            end
            
            it "returns the proper location array for a Black Pawn 5" do
                expect(pawn.set_location(5, "black")).to eq([2, 5])
            end

            it "returns the proper location array for a Black Pawn 6" do
                expect(pawn.set_location(6, "black")).to eq([2, 6])
            end
            
            it "returns the proper location array for a Black Pawn 7" do
                expect(pawn.set_location(7, "black")).to eq([2, 7])
            end

            it "returns the proper location array for a Black Pawn 8" do
                expect(pawn.set_location(8, "black")).to eq([2, 8])
            end
        end
    end

    context "when setting the unicode to be displayed" do
        describe "#set_unicode_value" do
            it "returns the correct unicode value for a White Pawn" do
                expect(pawn.set_unicode_value("white")).to eq("\u2659")
            end

            it "returns the correct unicode value for a Black Pawn"
                expect(pawn.set_unicode_value("black")).to eq("\u265f")
            end
        end
    end
end