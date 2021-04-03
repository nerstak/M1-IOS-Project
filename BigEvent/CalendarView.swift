import SwiftUI

struct CalendarView: View {
    var body: some View {
        NavigationView {
            VStack {
                if let activities = getActivities() {
                    ForEach(activities) { activity in
                        NavigationLink(destination: DetailsView(activity: activity)){
                            ActivityView(activity: activity)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
    
    func getActivities() -> [DummyActivity] {
        let now = Date()
        return [DummyActivity(id: "0", name: "Workshop for security novices", topic: "Wood & Steel", type: "Workshop", location: "Emerald Room", timeStart: now.addingTimeInterval(-3600), timeEnd: now.addingTimeInterval(3600))]
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
