import SwiftUI

struct PersonsView : View {
    @State var attendees: [Person] = []
    @State var speakers: [Person] = []
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(attendees) { attendee in
                    PersonView(person: attendee).frame(height: 120)
                }
            }.onAppear{
                Api().getAttendees { personsList in
                    personsList.forEach { person in
                        if( person.fields.isSpeaker() ) {
                            speakers.append(person)
                        } else {
                            attendees.append(person)
                        }
                    }
                }
            }
        }
    }
}

struct PersonsView_Previews: PreviewProvider {
    static var previews: some View {
        PersonsView()
    }
}

