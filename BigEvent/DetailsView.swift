import SwiftUI


/// Details of an activity
struct DetailsView: View {
    @State private var activity: Activity
    @State private var title: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                // Main informations
                Text("Activity informations").font(.title)
                ActivityView(activity: activity).frame(height: 150)
                
                // Speakers for this activity
                if let speakers = getSpeakers() // Replace his function with API call
                {
                    if speakers.count != 0 {
                        Text("Speakers").font(.title)
                        ForEach(speakers) { speaker in
                            PersonView(activity: speaker).frame(height: 150)
                        }
                    }
                }
                Spacer()
            }
        }.navigationBarTitle(title, displayMode: .inline)
    }
    
    init(activity: Activity, title: String) {
        _activity = State(initialValue: activity)
        _title = State(initialValue: title)
    }
    
    
    /// Generate a list of dummy speakers
    /// - Returns: list of dummy person
    func getSpeakers() -> [DummyPerson] {
        if let _ = activity.fields.speakerIds {
            return [DummyPerson(id: "1", name: "John Smith", speaker: true, email: "john.smith@gmail.com", phone: "(123) 456-7890", company: "Home SecurTech", role: "Head of Marketing")]
        }
        return []
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let df = DateForm()
        let now  = Date()
        let a = ActivityFields(topics: ["Wood & Steel"], type: "Workshop",activity: "Workshop for security novices", start: df.convertToString(date: now.addingTimeInterval(-3600)) , end:  df.convertToString(date: now.addingTimeInterval(3600)), locationId: ["Emerald Room"],speakerIds: ["0"])

        DetailsView(activity: Activity(id: "0", fields: a), title:"Hey")
    }
}
