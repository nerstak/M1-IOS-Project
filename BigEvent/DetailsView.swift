import SwiftUI

struct DetailsView: View {
    @State private var activity: Activity
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Activity informations").font(.title)
            ActivityView(activity: activity).frame(height: 150)
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
    }
    
    init(activity: Activity) {
        _activity = State(initialValue: activity)
    }
    
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

        DetailsView(activity: Activity(id: "0", fields: a))
    }
}
