import SwiftUI

struct DetailsView: View {
    @State private var activity: DummyActivity
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Activity informations").font(.title)
            ActivityView(activity: activity).frame(height: 150)
            if let speakers = getSpeakers() // Replace his function with API call
            {
                Text("Speakers").font(.title)
                ForEach(speakers) { speaker in
                    PersonView(activity: speaker).frame(height: 150)
                }
            }
            Spacer()
        }
    }
    
    init(activity: DummyActivity) {
        _activity = State(initialValue: activity)
    }
    
    func getSpeakers() -> [DummyPerson] {
        return [DummyPerson(id: "1", name: "John Smith", speaker: true, email: "john.smith@gmail.com", phone: "(123) 456-7890", company: "Home SecurTech", role: "Head of Marketing")]
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let now  = Date()
        let a: DummyActivity = DummyActivity(id: "0", name: "Workshop for security novices", topic: "Wood & Steel", type: "Workshop", location: "Emerald Room", timeStart: now.addingTimeInterval(-3600), timeEnd: now.addingTimeInterval(3600))

        DetailsView(activity: a)
    }
}
