import SwiftUI

struct DummyPerson: Decodable {
    var name: String
    var speaker: Bool
    var email: String
    var phone: String
    var company: String
    var role: String

    func getColor() -> Color {
        if (speaker) {
            return Color.blue
        } else {
            return Color.pink
        }
        
    }
}



struct PersonView: View {
    @State private var activity: DummyPerson
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 10) {
                VStack(alignment: .leading) {
                    Text(activity.name).font(.title3).fontWeight(.semibold).padding(.bottom, 2)
                    Text(activity.email).italic()
                    Text(activity.phone).font(.body)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text(activity.company).font(.body)
                    Text(activity.role).font(.body)
                }
            }.padding()
            .background(activity.getColor().opacity(0.8))
            .cornerRadius(15.0)
            .padding(.all, 10)
        }
    }
    
    
    init(activity: DummyPerson) {
        _activity = State(initialValue: activity)
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        let a: DummyPerson = DummyPerson(name: "John Smith", speaker: true, email: "john.smith@gmail.com", phone: "(123) 456-7890", company: "Home SecurTech", role: "Head of Marketing:")
        PersonView(activity: a)
    }
}
