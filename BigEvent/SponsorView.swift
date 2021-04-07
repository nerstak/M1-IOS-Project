import SwiftUI

struct SponsorView: View {
    @State private var sponsor : Sponsor
    
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .center) {
                Text(sponsor.fields.company).font(.title2).fontWeight(.semibold).lineLimit(1)
                //Fill the full width of the screen
            }.padding().frame(minWidth: 0,
                              maxWidth: .infinity,
                              alignment: .center
                      )
                    .background(sponsor.fields.getColor().opacity(0.8))
                    .cornerRadius(15.0)
                    .padding(.all, 10)
        }
    }
    
    init(sponsor : Sponsor) {
        _sponsor = State(initialValue: sponsor)
    }
}

struct SponsorView_Previews: PreviewProvider {
    static var previews: some View {
        let s = SponsorFields(company : "SimplySafe")
        SponsorView(sponsor : Sponsor(id: "0", fields: s))
    }
}
