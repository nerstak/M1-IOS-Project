import SwiftUI

struct CalendarView: View {
    @State var schedule: [Activity] = []

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                        ForEach(schedule) { a in
                            NavigationLink(destination: DetailsView(activity: a)){
                                                            ActivityView(activity: a).padding().frame(height: 150)
                                                        }
                                                        .buttonStyle(PlainButtonStyle())
                        
                    }
                }
                .onAppear {
                    Api().getSchedules {schedule in
                        self.schedule = schedule
                    }
                }
            }
            .navigationBarTitle(Text("Calendar"), displayMode: .inline)
            
            
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
