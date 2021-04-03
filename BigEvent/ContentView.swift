//
//  ContentView.swift
//  BigEvent
//
//  Created by Louis-Marie Merminod on 16/03/2021.
//

import SwiftUI


struct ContentView: View {
    @State var schedules: [Schedule]?
    
    init() {
    }

    var body: some View {
        Text("vide").padding()
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



