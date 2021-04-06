import SwiftUI

struct PersonsView : View {
    @State var attendees: [Person] = []
    @State var speakers: [Person] = []
    @State var shownPersons: [Person] = []
    @State private var selection = -1
    
    var body: some View {
        VStack{
            Picker("Select an appearence", selection: $selection) {
                Text("Attendees").tag(0)
                Text("Speakers").tag(1)
            }.pickerStyle(SegmentedPickerStyle())

            if(selection == 0) {
                PersonListView(persons: attendees)
            } else {
                PersonListView(persons: speakers)
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

