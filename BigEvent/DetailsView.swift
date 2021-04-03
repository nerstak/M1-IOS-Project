import SwiftUI

struct DetailsView: View {
    @State private var activity: Activity
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Activity informations").font(.title)
            ActivityView(activity: activity).frame(height: 150)
            if let speakers = getSpeakers() // Replace his function with API call
            {
                Text("Speakers").font(.title)
                ForEach(speakers) { speaker in
                    PersonView(activity: speaker).frame(height: 150).padding(.top, 40)
                }
            }
            Spacer()
        }
    }
    
    init(activity: Activity) {
        _activity = State(initialValue: activity)
    }
    
    func getSpeakers() -> [DummyPerson] {
        return [DummyPerson(id: "1", name: "John Smith", speaker: true, email: "john.smith@gmail.com", phone: "(123) 456-7890", company: "Home SecurTech", role: "Head of Marketing")]
    }
}