//
//  ContentView.swift
//  BancoInter
//
//  Created by Raphael Cerqueira on 23/12/20.
//

import SwiftUI

struct ContentView: View {
    @State var isVisible = false
    @State var selectedIndex = 0
    @State var isExpanded = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack {
                VStack(spacing: 30) {
                    HStack {
                        VStack(alignment: .leading) {
                            TabView(selection: $selectedIndex) {
                                PageView(isVisible: $isVisible, title: "Saldo em conta")
                                    .tag(0)
                                
                                PageView(isVisible: $isVisible, title: "Total investido")
                                    .tag(1)
                            }
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                            .frame(width: UIScreen.main.bounds.width / 2, height: 120)
                            
                            HStack {
                                ForEach(0 ..< 2) { index in
                                    Capsule()
                                        .frame(width: 20, height: 2)
                                        .opacity(selectedIndex == index ? 0.7 : 0.3)
                                }
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            ZStack(alignment: .topTrailing) {
                                Image("profile")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                
                                Circle()
                                    .fill(Color(#colorLiteral(red: 0.997214973, green: 0.9344266057, blue: 0, alpha: 1)))
                                    .frame(width: 13, height: 13)
                            }
                        })
                    }
                    
                    LazyVGrid(columns: [
                                GridItem(.flexible(minimum: 100, maximum: 200)),
                                GridItem(.flexible(minimum: 100, maximum: 200)),
                                GridItem(.flexible(minimum: 100, maximum: 200))
                    ], spacing: 10, content: {
                        ForEach(menuItems) { item in
                            Button(action: {}, label: {
                                VStack {
                                    Image(systemName: item.image)
                                        .font(.system(size: 27))
                                        .foregroundColor(Color(#colorLiteral(red: 0.9233391881, green: 0.4260931611, blue: 0.01353600342, alpha: 1)))
                                        .padding(13)
                                        .background(Color(#colorLiteral(red: 0.9602255225, green: 0.9645934701, blue: 0.9818953872, alpha: 1)))
                                        .clipShape(Circle())
                                    
                                    Text(item.title)
                                        .font(.system(size: 15))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.center)
                                        
                                }
                            })
                            .frame(width: (UIScreen.main.bounds.width - 50) / 3, height: (UIScreen.main.bounds.width - 50) / 3)
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                    })
                }
                .padding()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding(.bottom, -100)
                .foregroundColor(Color.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.4808716774, blue: 0.006787013263, alpha: 1)), Color(#colorLiteral(red: 0.9981626868, green: 0.3348763287, blue: 0.05063842982, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading))
                .padding(.bottom, 85)
                
                if isExpanded {
                    MenuView()
                        .padding(.horizontal)
                }
                
                Button(action: {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }, label: {
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .resizable()
                        .font(.system(size: 21, weight: .bold, design: .rounded))
                        .frame(width: 40, height: 8)
                        .foregroundColor(Color(#colorLiteral(red: 0.9981626868, green: 0.3348763287, blue: 0.05063842982, alpha: 1)))
                })
                .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(0 ..< 3) { item in
                            VStack(alignment: .leading) {
                                Text("Tenha limite de crédito na hora")
                                    .font(.system(size: 21))
                                    .fontWeight(.bold)
                                
                                HStack {
                                    Image("limite")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 150, height: 50)
                                    
                                    VStack(alignment: .leading, spacing: 15) {
                                        Text("Invista no CDB Mais Limite de Crédito e libere seu crédito para usar como quiser.")
                                            .font(.system(size: 17))
                                            .foregroundColor(Color.primary.opacity(0.8))
                                        
                                        Button(action: {}, label: {
                                            Text("Investir agora")
                                                .foregroundColor(.white)
                                                .padding(.horizontal)
                                                .padding(.vertical, 12)
                                                .background(Color(#colorLiteral(red: 0.9981626868, green: 0.3348763287, blue: 0.05063842982, alpha: 1)))
                                                .cornerRadius(12)
                                        })
                                    }
                                }
                            }
                            .padding()
                            .frame(width: UIScreen.main.bounds.width - 60)
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
                
                Spacer()
            }
        })
        .background(Color(#colorLiteral(red: 0.9602255225, green: 0.9645934701, blue: 0.9818953872, alpha: 1)))
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct MenuView: View {
    var body: some View {
        LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 100, maximum: 200)),
                    GridItem(.flexible(minimum: 100, maximum: 200)),
                    GridItem(.flexible(minimum: 100, maximum: 200))
        ], spacing: 10, content: {
            ForEach(menuOtherItems) { item in
                Button(action: {}, label: {
                    VStack {
                        Image(systemName: item.image)
                            .font(.system(size: 27))
                            .foregroundColor(Color(#colorLiteral(red: 0.9233391881, green: 0.4260931611, blue: 0.01353600342, alpha: 1)))
                            .padding(13)
                            .background(Color(#colorLiteral(red: 0.9602255225, green: 0.9645934701, blue: 0.9818953872, alpha: 1)))
                            .clipShape(Circle())

                        Text(item.title)
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)

                    }
                })
                .frame(width: (UIScreen.main.bounds.width - 50) / 3, height: (UIScreen.main.bounds.width - 50) / 3)
                .background(Color.white)
                .cornerRadius(10)
            }
        })
    }
}

struct PageView: View {
    @Binding var isVisible: Bool
    var title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 22))
            
            HStack {
                HStack {
                    Text("R$")
                        .font(.system(size: 26))
                        .opacity(0.7)
                    
                    Text("3.089,09")
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                }
                .redacted(reason: isVisible ? .placeholder : .init())
                
                Button(action: {
                    isVisible.toggle()
                }, label: {
                    Image(systemName: isVisible ? "eye.slash" : "eye")
                })
                .padding(.leading, 4)
            }
            
            Text("em 03 de março")
                .opacity(0.7)
        }
    }
}

struct MenuItem: Identifiable {
    let id = UUID().uuidString
    var title: String
    var image: String
}

let menuItems = [
    MenuItem(title: "Transferências", image: "arrow.2.squarepath"),
    MenuItem(title: "Pagamentos", image: "barcode.viewfinder"),
    MenuItem(title: "Investimentos", image: "chart.bar.xaxis")
]

let menuOtherItems = [
    MenuItem(title: "Cartão", image: "creditcard"),
    MenuItem(title: "Gift Card", image: "gift"),
    MenuItem(title: "Seguros", image: "umbrella"),
    MenuItem(title: "Interpag", image: "qrcode.viewfinder"),
    MenuItem(title: "Depósito por boleto", image: "doc"),
    MenuItem(title: "Depósito por cheque", image: "menubar.dock.rectangle"),
    MenuItem(title: "adsfaf", image: "menubar.dock.rectangle"),
    MenuItem(title: "Agendamentos", image: "calendar"),
    MenuItem(title: "Portabilidade de salário", image: "briefcase"),
    MenuItem(title: "asdfasdfas", image: "briefcase"),
    MenuItem(title: "Financiamento Imobiliário", image: "house"),
    MenuItem(title: "Débito Automático", image: "menubar.dock.rectangle.badge.record"),
    MenuItem(title: "Consórcio", image: "key"),
    MenuItem(title: "Câmbio", image: "eurosign.square"),
    MenuItem(title: "Recarga", image: "arrow.up.square")
]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
