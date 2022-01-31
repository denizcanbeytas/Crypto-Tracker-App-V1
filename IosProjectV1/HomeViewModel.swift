//
//  HomeViewModel.swift
//  IosProjectV1
//
//  Created by Deniz on 26.01.2022.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    //@Published var sortOption: SortOption = .holdings
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        addSubscribers()
    }
    func addSubscribers(){
        //update AllCoins
        dataService.$allCoins
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        
    }
    
    
}

/**
 
 enum SortOption {
     case rank, rankReversed, holdings, holdingsReversed, price, priceReversed
 }
 
 private func sortCoins(sort: SortOption, coins: inout [CoinModel]) {
     switch sort {
     case .rank, .holdings:
        coins.sort(by: { $0.rank < $1.rank })
     case .rankReversed, .holdingsReversed:
        coins.sort(by: { $0.rank > $1.rank})
     case .price:
        coins.sort(by: { $0.currentPrice > $1.currentPrice})
     case .priceReversed:
        coins.sort(by: { $0.currentPrice < $1.currentPrice})
 }
}
 
 */
