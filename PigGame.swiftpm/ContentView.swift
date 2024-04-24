import SwiftUI

struct ContentView: View {
    @State var roundScore: Int = 0
    @State var totalScore1: Int = 0
    @State var totalScore2: Int = 0
    @State var dieNum: Int = 0
    @State var player1Turn: Bool = true
    @State var gameOver: Bool = false
    var body: some View {
        VStack {
            Text("Pig 🐷")
                .font(.largeTitle)
                .padding()
            if totalScore1 < 100 || totalScore2 < 100{
                Text("Get 100 Points to Win!")
            }
            if gameOver == false{
                Button("Roll Dice"){
                    rollDice()
                }
                .font(.title)
                Button("Bank Points"){
                    bankPoints()
                    if totalScore1 == 100 || totalScore1 > 100{
                        gameOver = true
                    }
                    if totalScore2 == 100 || totalScore2 > 100{
                        gameOver = true
                    }
                }
                .font(.title)
            }
            if gameOver == true{
                Button("Restart Game"){
                    restartGame()
                }
                .font(.title)
            }
            Image(systemName:"\(dieNum).square.fill")
                .resizable()
                .frame(width:100,height:100)
                .padding()
            if player1Turn == true{
                Text("Player 1 Turn")
                    .font(.largeTitle)
                    .padding()
            }else{
                Text("Player 2 Turn")
                    .font(.largeTitle)
                    .padding()
            }
            Text("Round Score: \(roundScore)")
                .font(.largeTitle)
            Text("Player 1 Total Score: \(totalScore1)")
                .font(.title2
                )
            Text("Player 2 Total Score: \(totalScore2)")
                .font(.title2)
            if totalScore2 == 100 || totalScore2 > 100{
                Text("Player 2 Wins")
                    .font(.largeTitle)
//                gameOver = true
            }
            if totalScore1 == 100 || totalScore1 > 100{
                Text("Player 1 Wins")
                    .font(.largeTitle)
//                gameOver = true
            }            
        }
        Spacer()
    }
    func rollDice(){
        dieNum = Int.random(in: 1..<7)
        roundScore = roundScore + dieNum
        if dieNum == 1{
            roundScore = 0
            bankPoints()
        }
    }
    func bankPoints(){
        if player1Turn == true{
            totalScore1 = totalScore1 + roundScore
        }else{
            totalScore2 = totalScore2 + roundScore
        }
//        if totalScore1 == 100 || totalScore1 > 100{
//            roundScore = 0
//            totalScore1 = 0
//            totalScore2 = 0
//        }
//        if totalScore2 == 100 || totalScore2 > 100{
//            roundScore = 0
//            totalScore2 = 0
//            totalScore1 = 0
//        }
        if player1Turn == true{
            player1Turn = false
        }else{
            player1Turn = true
        }
        roundScore = 0
    }
    func restartGame(){
        roundScore = 0
        totalScore1 = 0
        totalScore2 = 0
        player1Turn = true
        gameOver = false
    }
}
