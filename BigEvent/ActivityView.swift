import SwiftUI

struct DummyActivity: Decodable, Identifiable {
    var id: String
    var name: String
    var topic: String
    var type: String
    var location: String
    var timeStart: Date
    var timeEnd: Date

    func getColor() -> Color {
        switch type {
        case "Keynote":
            return Color.orange
        case "Panel":
            return Color.blue
        case "Workshop":
            return Color.pink
        case "Breakout session":
            return Color.purple
        case "Meal":
            return Color.yellow
        case "Networking":
            return Color.green
        default:
            return Color.gray
        }
    }
}



struct ActivityView: View {
    @State private var activity: DummyActivity
    
    private var formatter: DateFormatter
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text(activity.name).font(.title2).fontWeight(.semibold).padding(.bottom, 2)
                Text(activity.topic).font(.callout)
                Text(activity.type).font(.body)
                HStack(spacing: 10) {
                    Text(activity.location).italic()
                    Spacer()
                    Text(formatter.string(from: activity.timeStart)).fontWeight(.light) +
                    Text(" - ") +
                    Text(formatter.string(from: activity.timeEnd)).fontWeight(.light)
                }
            }.padding()
            .background(activity.getColor().opacity(0.8))
            .cornerRadius(15.0)
            .padding(.all, 10)
        
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).foregroundColor(.red)
                
                Text("Live").foregroundColor(.white)
            }
            .frame(width: 40, height: 15)
            .offset(x: geometry.size.width - 40, y: 5)
            .opacity(activity.timeEnd > Date() ? 1 : 0)
        }
        
    }
    
    init(activity: DummyActivity) {
        formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        _activity = State(initialValue: activity)
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        let now  = Date()
        let a: DummyActivity = DummyActivity(id: "0", name: "Workshop for security novices", topic: "Wood & Steel", type: "Workshop", location: "Emerald Room", timeStart: now.addingTimeInterval(-3600), timeEnd: now.addingTimeInterval(3600))
        ActivityView(activity: a)
    }
}
