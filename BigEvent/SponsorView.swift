import SwiftUI

struct SponsorView: View {
    @State private var sponsor : Sponsor
    
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .center) {
                Text(sponsor.fields.company).fontWeight(.semibold).lineLimit(1)
                Spacer()
                Text(sponsor.fields.status).italic().lineLimit(2)
                // There is always an ammoint sponsored unless the status is a verbal commitment
                if(sponsor.fields.status != "Verbal committment to sponsor"){
                    Text(String(sponsor.fields.sponsoredAmount!)).lineLimit(1)
                }
                //Fill the full width of the screen
            }.padding().frame(minWidth: 0,
                              maxWidth: .infinity,
                              alignment: .leading
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
        let s = SponsorFields(company : "SimplySafe", status : "Verbal committment to sponsor")
        SponsorView(sponsor : Sponsor(id: "0", fields: s))
    }
}
