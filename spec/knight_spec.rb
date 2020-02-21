require "rspec"
require "knight"

describe Knight do
    subject(:knight) { Knight.new("white") }

    context "when placing the Knight on the board to start the game" do
        describe "#set_location" do
            it "returns the proper location array for a White Knight" do
                expect(knight.set_location("white")).to eq([1, 5])
            end
            it "returns the proper location array for a Black Knight" do
                expect(knight.set_location("black")).to eq([8, 5])
            end
        end
    end

    context "when setting the unicode to be displayed" do
        describe "#set_unicode_value" do
            it "returns the correct unicode value for a White Knight"

            it "returns the correct unicode value for a Black Knight"
        end
    end

    context "when determining where the King can move next" do
        
    end

    context "when determining whether the King can move up the board" do
        
    end

    context "when determining whether the King can move left" do
        
    end

    context "when determining whether the King can move down the board" do
    
    end

    context "when determining whether the King can move right" do
    
    end
end
