import SwiftUI

struct ContentView: View {
    @State var score: Int = 0
    @State var clickPower: Int = 1
    @State var lavacost: Int = 50
    @State var lavaclaimed: Bool = false
    @State var showVarre: Bool = false
    @State var showMalardia: Bool = false
    @State var showAlbinauric: Bool = false
    @State var imageWidth: Int = 200
    @State var FarumCost: Int = 1000
    var body: some View {
        VStack {
            Text("Iron Fist Alexander Clicker")
                .font(.title)
                .padding(50)
                .onTapGesture(count:2, perform: {
                    showMalardia.toggle()
                })
            Text("Your Click Power is \(clickPower)")
            Button(action: {clicked()}, label:  {
                Image("Alexander")
            })
            Text("You have \(score) Warrior Jar Shards")
                .onTapGesture(count:10, perform: {
                    showAlbinauric.toggle()
                })
            HStack{
                Text("This is a Warrior Jar Shard ->")
                    .onTapGesture{
                        showVarre.toggle()
                        print("jar shard clicked")
                    }
                Image("JarShard")
            }
            HStack{
                VStack{
                    Text("Lava Training")
                    Text("\(lavacost) Warrior Jar Shards")
                    Text("+1 Click Power")
                    Button(action: {lavaupgrade()}, label: {
                        Image("LavaAlexander")
                            .resizable()
                            .frame(width: 100, height:100)   
                    })
                    .disabled(score < lavacost)
                }
                VStack{
                    Text("Crumbling Farum Azula Fight")
                    Text("\(FarumCost) Warrior Jar Shards")
                    Text("2x Click Power")
                    Button(action:{FarumUpgrade()}, label:{
                        Image("YMiyazaki")
                            .resizable()
                            .frame(width: 100,height:100)
                    })
                    .disabled(score < FarumCost)
                }
            }
                HStack{
                    if showVarre == true{
                        Button(action:{Maidenless()},label:{
                            Image("NoMaiden")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxHeight: .infinity)
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity)   
                        })
                    }
                    if showMalardia == true{
                        Image("Malardia")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: .infinity)
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                    }
                    if showAlbinauric == true{
                        Button(action:{HiddenAlbinauric()}, label: {
                            Image("Albinauric")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxHeight: .infinity)
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity)
                        })
                    }

                Spacer()
            }
        }
        
    }
    func clicked(){
        score += clickPower
        print("Alexander hit")
    }
    func lavaupgrade(){
        score = score - lavacost
        clickPower += 1
        lavacost = lavacost + 50
    }
    func FarumUpgrade(){
        score = score - FarumCost
        clickPower *= 2
        FarumCost = FarumCost + 5000
    }
    func HiddenAlbinauric(){
        score = score + 100000
        showAlbinauric = false
        print("The hidden Albinauric blessed you with 100,000 Warrior Jar Shards")
}
    func Maidenless(){
        score = 0
        clickPower = 1
        showVarre = false
        print("Varre called you maidenless and took all your Warrior Jar Shards and reset your click power to 1")
    }
}
