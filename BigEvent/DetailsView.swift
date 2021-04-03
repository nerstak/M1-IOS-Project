import SwiftUI

struct DetailsView: View {
    @State private var activity: DummyActivity
    
    var body: some View {
        VStack {
            ActivityView(activity: activity, clickable: false)
            if let speakers = getSpeakers() // Replace his function with API call
            {
                ForEach(speakers) { speaker in
                    PersonView(activity: speaker)
                }
            }
        }
    }
    
    init(activity: DummyActivity) {
        _activity = State(initialValue: activity)
        // We should fill speakers array right here
    }
    
    func getSpeakers() -> [DummyPerson] {
        return [DummyPerson(id: "1", name: "John Smith", speaker: true, email: "john.smith@gmail.com", phone: "(123) 456-7890", company: "Home SecurTech", role: "Head of Marketing")]
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let now  = Date()
        let a: DummyActivity = DummyActivity(name: "Workshop for security novices", topic: "Wood & Steel", type: "Workshop", location: "Emerald Room", timeStart: now.addingTimeInterval(-3600), timeEnd: now.addingTimeInterval(3600))

        DetailsView(activity: a)
    }
}
