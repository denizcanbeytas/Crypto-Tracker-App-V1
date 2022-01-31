//
//  CoinRowView.swift
//  IosProjectV1
//
//  Created by Deniz on 15.01.2022.
//

import SwiftUI

struct CoinRowView: View {
    @State var counter = 1000
    @State private var showingAlert = false
    
    
    
    let coin: CoinModel
    // Bu kısım kaç adet coin tutulduğunu gösteriyor ve diğersayfada olacağı için bool yapıyoruz.
    let showHoldingsColumn: Bool
    
    
    var body: some View {
        HStack(spacing: 0){
            leftColumn
            Spacer()
            //---------- <- kaç adet coin var
            if showHoldingsColumn {
                centerColumn
            }
            //-----------
            rightColumn
        }
        .font(.subheadline) // Hstack'e verildi
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        
        CoinRowView(coin: dev.coin, showHoldingsColumn: true)
    }
}

extension CoinRowView {
    
    // -> code'un daha güzel görünmesi için sütunları ayrı ayrı yazdım
    
    private var leftColumn: some View{
        
        HStack(spacing: 0){
            //  rank integer olduğu için "\(coin.rank)" -> bu şekilde string yaptık
            Text("\(coin.rank)") // coin numaraları buradan çekiliyor
                .font(.caption)
                .foregroundColor(.black)
                .frame(minWidth: 30)
            //Circle()
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased()) // uppercased harfleri büyüttü
                .font(.headline)
                .padding(.leading, 6) // leading, padding değerini ayarlıyor
                .foregroundColor(.black)
            Button(action: {
                self.counter -= Int(coin.currentPrice)
                if self.counter <= Int(coin.currentPrice) {
                    //showingAlert = true
                    showingAlert.toggle()
                }
            },label: {
                Text("Al")
                    .frame(width: 20, height: 20)
                    .background(Color.green)
                    .foregroundColor(Color.black)
                    .padding()
            }).alert(isPresented: $showingAlert) {
                Alert(title: Text("Limiti Aştın"), message: Text("Daha fazla alım yapamazsın"), dismissButton: .default(Text("OK")))
            }
            Text("\(counter)")
                    .font(.largeTitle)
                    .padding()
        }
    }
    
    //----- Int(coin.currentPrice)
    
    private var centerColumn: some View { // <- kaç adet coin var
        VStack(alignment: .trailing){
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(.black)
    }
    
    //-----
    
    private var rightColumn: some View {
        VStack(alignment: .trailing){ // sağa yapıştırdık
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                // "\(coin.currentPrice)" <- artık yapmaya gerek yok
                .bold()
                .foregroundColor(.black)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                //"\(coin.priceChangePercentage24H ?? 0)%"
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ?
                    Color.green : Color.red
                )
        }
        // 3 ana ekran olduğu için böyle yaptık
        // Bu özelliği kullanabilmek için sadece portrait modu açık olması lazım
        // Bunu coin adetlerini Hstack'e düzgün bastırabilmek için yaptı
        .frame(width: UIScreen.main.bounds.width/3.5, alignment: .trailing)
    }
}


// Notes for own view folder
/*
 -coin modelden her defasında farklı yerlere coin çekeceğimiz için, PreviewProvider bize her coin için bir tanımlama isteyecek.
    + Biz de bu tanımlamaları burada görüntü kirliliği olmasın diye extensions klasöründe PreviewProvider adlı bir swift dosyası oluşturacağız ve böylelikle bu sorunu orada çözeceğiz
 - cmd + shft + k --> previer temizliyor
 - Command + Shift + B -> saçma sapan bir hata verirse
 
 */
