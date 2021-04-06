//
//  ContentView.swift
//  BigEvent
//
//  Created by Louis-Marie Merminod on 16/03/2021.
//

import SwiftUI


/// Main view of application
struct ContentView: View {
    @State var schedules: [Activity]?
    
    init() {
    }

    var body: some View {
        TabView {
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                }
            PersonsView()
                .tabItem {
                    Image(systemName: "person.3")
                
                }
            Text("Sponsors list") // Replace this by SponsorsView
                .tabItem {
                    Image(systemName: "dollarsign.circle")
                }
        }
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



