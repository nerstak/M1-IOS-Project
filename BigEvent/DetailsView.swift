import SwiftUI


/// Details of an activity
struct DetailsView: View {
    @State private var activity: Activity
    @State private var title: String
    @State var persons: [Person] = []

    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                // Main informations
                Text("Activity informations").font(.title)
                ActivityView(activity: activity).frame(height: 150).padding().onAppear {
                    if let personsIds = activity.fields.speakerIds {
                        personsIds.forEach { personsId in
                            Api().getPerson(idPerson: personsId) { p in
                                if let p = p {
                                    self.persons.append(p)
                                }
                            }
                        }
                    }
                }

                // Speakers for this activity

                if persons.count != 0 {
                    PersonListView(persons: persons, title: "Speakers")
                }
                Spacer()
            }
        }.navigationBarTitle(title, displayMode: .inline)
    }

    init(activity: Activity, title: String) {
        _activity = State(initialValue: activity)
        _title = State(initialValue: title)
    }

}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let df = DateForm()
        let now = Date()
        let a = ActivityFields(topics: ["Wood & Steel"], type: "Workshop", activity: "Workshop for security novices", start: df.convertToString(date: now.addingTimeInterval(-3600)), end: df.convertToString(date: now.addingTimeInterval(3600)), locationId: ["Emerald Room"], speakerIds: ["0"])

        DetailsView(activity: Activity(id: "0", fields: a), title: "Hey")
    }
}
