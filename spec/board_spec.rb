require "rspec"
require "board"
require "chessSet"

describe Board do
    subject(:board) { Board.new }

    context "when building the board" do
        describe "#build_board" 
            it "creates an array of 9 rows" do
                expect(board.board.length).to eq(9)
            end

            it "has rows that have 9 columns" do
                expect(board.board[0].length).to eq(9)
            end

            it "makes the second column of the first row the letter a" do
                expect(board.board[0][1]).to eq("a")
            end
        end

        describe "#place_pieces" do
            it "places the White King in the correct location" do
                expect(board.board[1][5]).to eq(board.white_set.pieces[-1])
            end

            it "places the Black Queen in the correct location" do
                expect(board.board[8][4]).to eq(board.black_set.pieces[-2])
            end
        end
    

    context "when checking to see if either player is in check" do
        describe "#check_check"

        describe "#black_check"

        describe "#white_check"
    end

end