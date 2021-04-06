import SwiftUI

struct PersonListView : View {
    @State var persons: [Person]
    
    var body: some View {
        //Displays given list of persons
        ScrollView {
            VStack {
                ForEach(persons) { person in
                    PersonView(person: person).frame(height: 120)
                }
            }
            }
        }
    
    init(persons: [Person]) {
        _persons = State(initialValue: persons)
    }
}

struct PersonListView_Previews: PreviewProvider {
    static var previews: some View {
        PersonListView(persons: [])
    }
}

struct AttendeesView_Previews: PreviewProvider {
    static var previews: some View {
        PersonListView(persons: [])
    }
}
