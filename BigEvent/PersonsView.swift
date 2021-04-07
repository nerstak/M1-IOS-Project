import SwiftUI

struct PersonsView : View {
    @State var attendees: [Person] = []
    @State var speakers: [Person] = []
    @State var shownPersons: [Person] = []
    @State private var selection = -1
    
    var body: some View {
        VStack{
            if (selection != -1) {
                Picker("Select an appearence", selection: $selection) {
                    Text("Attendees").tag(0)
                    Text("Speakers").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
            }

            // Displays view depending on picked value
            if(selection == 0) {
                PersonListView(persons: attendees, title: "Attendees")
            } else if (selection == 1) {
                PersonListView(persons: speakers, title: "Speakers")
            } else {
                Text("loading...")
            }
        }.frame(alignment: .top).onAppear{
            Api().getAttendees { personsList in
                personsList.forEach { person in
                    // Puts speakers in speakers list and attendees in attendees list
                    if( person.fields.isSpeaker() ) {
                        speakers.append(person)
                    } else {
                        attendees.append(person)
                    }
                }
                // Only allows creation of PersonListView once values are gathered at least once
                if(selection == -1){
                    selection = 0
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

