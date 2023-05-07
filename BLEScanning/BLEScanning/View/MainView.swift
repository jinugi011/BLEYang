//
//  ContentView.swift
//  BLEScanning
//
//  Created by Jin Wook Yang on 2023/04/17.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.scenePhase) var scenePhase
    
    @State
    private var isActivated : Bool = false
    
    lazy var viewModel : MainViewModel = {
        return MainViewModel()
    }()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                VStack {
                    Text("Hello")
                        .fontWeight(.bold)
                        .font(.system(size : 80))
                }
                .padding(isActivated ?  20 : 10)
                .background(isActivated ? Color.yellow : Color.blue)
                .onTapGesture {
                    print("HStack Is Click ")
                    //Animation with
                    withAnimation {
                        self.isActivated.toggle()
                    }
                } //HStack
                
                NavigationLink(destination: BLEListView()
                ) {
                    Text("네비게이션")
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(30)
                } .padding(.top, 5)
            }
        }.onChange(of: scenePhase) { phase in
            switch phase {
            case .active:
                Logger.ui("켜집")
            case .background:
                Logger.ui("백그라운드")
            case .inactive:
                Logger.ui("백그라운드 프로세스동작")
            @unknown default:
                Logger.ui("에러")
            }
            
        }
        
    }
    
    
    func tableView() {
        
    }
    
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
