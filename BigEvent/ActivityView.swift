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
    private var badgePosition: CGFloat = 2
    
    var body: some View {
        GeometryReader { geometry in
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
            .background(Color.purple.opacity(0.8))
            .cornerRadius(15.0)
            .padding(.all, 10)
        
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).foregroundColor(.red)
                
                Text("Live").foregroundColor(.white)
            }
            .frame(width: 40, height: 15)
            .offset(x: geometry.size.width - 40, y: 5)
        }
        
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
