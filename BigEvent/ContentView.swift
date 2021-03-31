//
//  ContentView.swift
//  BigEvent
//
//  Created by Louis-Marie Merminod on 16/03/2021.
//

import SwiftUI


struct ContentView: View {
    @State var schedules: [Schedule]?

    var body: some View {
        Text(schedules?[0].fields.topics?[0] ?? "vide")
                .padding()

        Button(action: Click) {
            Text("Let's go !")
        }
    }

    func Click() {
        RequestFactory().getScheduleList() {
            (schedules) in
            self.schedules = schedules
            getTopicsNames()
        }
    }


}


