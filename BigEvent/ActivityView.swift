//
//  ActivityView.swift
//  BigEvent
//
//  Created by user188893 on 3/24/21.
//

import SwiftUI

struct DummyActivity {
    var name: String
    var topic: String
    var type: String
    var location: String
    var time: Date
}


struct ActivityView: View {
    @State private var activity: DummyActivity = DummyActivity(name: "Workshop for security novices", topic: "Wood & Steel", type: "Workshop", location: "Emerald Room", time: Date())
    
    private var formatter: DateFormatter
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(activity.name).font(.title2).fontWeight(.semibold).padding(.bottom, 2)
            Text(activity.topic).font(.callout)
            Text(activity.type).font(.body)
            HStack(spacing: 10) {
                Text(activity.location).italic()
                Spacer()
                Text(formatter.string(from: activity.time)).fontWeight(.light)
            }
        }.padding()
        .background(Color.purple)
        .cornerRadius(15.0)
    }
    
    init() {
        formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
