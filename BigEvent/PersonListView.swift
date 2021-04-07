import SwiftUI

struct PersonListView : View {
    @State var persons: [Person]
    @State var title: String
    
    var body: some View {
        //Displays given list of persons
        ScrollView {
            VStack(alignment:.center) {
                Text(title).font(.title)
                ForEach(persons) { person in
                    PersonView(person: person).frame(height: 130)
                }
            }
        }
    }
    
    init(persons: [Person], title : String) {
        _persons = State(initialValue: persons)
        _title = State(initialValue: title)
    }
}

struct PersonListView_Previews: PreviewProvider {
    static var previews: some View {
        PersonListView(persons: [], title: "Title")
    }
}
