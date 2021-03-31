//
//  ContentView.swift
//  BigEvent
//
//  Created by Louis-Marie Merminod on 16/03/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Homepage") // Replace this by HomepageView
                .tabItem {
                    Image(systemName: "calendar")
                }
            Text("Attendees list") // Replace this by AttendeesView
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
