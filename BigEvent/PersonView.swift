import SwiftUI


struct PersonView: View {
    @State private var person: Person
    @State private var company: String?;

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text(person.fields.name).font(.title3).fontWeight(.semibold).padding(.bottom, 2)

                HStack(alignment: .top, spacing: 8) {
                    VStack(alignment: .leading) {
                        HStack() {
                            Image(systemName: "envelope")
                            Text(person.fields.email).italic().minimumScaleFactor(0.7).lineLimit(1)
                        }.padding(.bottom, -3.8)
                        HStack() {
                            Image(systemName: "phone")
                            Text(person.fields.phone).font(.body).minimumScaleFactor(0.7).lineLimit(1)
                        }
                    }.frame(minWidth: geometry.size.width * 0.5)
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(company ?? "").font(.body).fontWeight(.semibold).minimumScaleFactor(0.7).lineLimit(1).padding(.bottom, -6.8).onAppear {
                            Api().getCompany(idCompany: person.fields.company[0]) { c in
                                self.company = c
                            }
                        }
                        Text(person.fields.role).italic().minimumScaleFactor(0.7).lineLimit(1)
                    }
                }
            }.padding()
                    .background(person.fields.getColor().opacity(0.8))
                    .cornerRadius(15.0)
                    .padding(.all, 10)
        }
    }


    init(person: Person) {
        _person = State(initialValue: person)
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        let a = PersonFields(name: "Bob", role: "VP of Sales", type: "Speaker", email: "bob@gmail.com", phone: "1111111111", company: ["11234553534"])

        PersonView(person: Person(id: "0", fields: a))
    }
}
