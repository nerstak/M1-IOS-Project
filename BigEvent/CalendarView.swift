import SwiftUI

struct CalendarView: View {
    @State var schedule: [Activity] = []

    var body: some View {
        NavigationView {
            List(schedule) { activity in
                NavigationLink(destination: DetailsView(activity: activity)) {
                    ActivityView(activity: activity)
                }
                        .buttonStyle(PlainButtonStyle())
            }.onAppear {
                Api().getSchedules { schedule in
                    self.schedule = schedule
                }
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
