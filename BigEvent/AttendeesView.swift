import SwiftUI

struct AttendeesView : View {
    @State var attendees: [Person] = []
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(attendees) { attendee in
                    PersonView(person: attendee).frame(height: 120)
                }
            }.onAppear{
                Api().getAttendees { attendee in
                    self.attendees = attendee
                }
            }
        }
    }
}

struct AttendeesView_Previews: PreviewProvider {
    static var previews: some View {
        AttendeesView()
    }
}

