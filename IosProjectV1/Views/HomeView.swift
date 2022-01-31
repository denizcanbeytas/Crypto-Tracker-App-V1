//
//  HomeView.swift
//  IosProjectV1
//
//  Created by Deniz on 26.01.2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel
    var body: some View {
        ZStack{
            VStack{
                homeHeader
                columnTitles
                allCoinList
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()
        }
        .environmentObject(dev.homeVM)
        
    }
}

extension HomeView{
    
    private var homeHeader: some View {
        HStack{
            Image("Image")
                .resizable()
                .cornerRadius(400)
                .scaledToFit()
                .frame(width: 300 , height: 250)
                .padding(EdgeInsets(top: -50, leading:0, bottom: 30, trailing: 0))
                
        }
    }
    
    private var allCoinList: some View {
        List{
            ForEach(vm.allCoins){coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 20, leading:0, bottom: 20, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var columnTitles: some View {
        HStack{
            Text("Coins")
            Spacer()
            Text("Price")
        }
        .font(.caption)
        .foregroundColor(Color.gray)
        .padding(.horizontal)
    }
}

/*
 HStack(spacing: 4){
     Text("Coin")
     Image(systemName: "chevron.down")
         .opacity((vm.sortOption == .rank || vm.sortOption == .rankReversed) ? 1.0 : 0.0)
         .rotationEffect(Angle(degrees: vm.sortOption == .rank ? 0 : 180))
 }
 .onTapGesture {
     withAnimation(.default){
         vm.sortOption = vm.sortOption == .rank ? .rankReversed : .rank
     }
 
 //.listRowBackground(Color.red)
 }
 */
