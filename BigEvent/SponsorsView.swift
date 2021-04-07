import SwiftUI

struct SponsorsView: View {
    @State var sponsors : [Sponsor] = []
    
    var body: some View {
        ScrollView {
            // Get the list of sponsors and display each in a view
            VStack(alignment: .center) {
                Text("Sponsors").font(.title)
                
                //Sort sponsors by biggest sponsored amount
                let sponsorSorted = sponsors.sorted{ (lhs: Sponsor, rhs: Sponsor) -> Bool in
                    return lhs.fields.sponsoredAmount ?? 0 > rhs.fields.sponsoredAmount ?? 0
                }
                ForEach(sponsorSorted) { sponsor in
                    SponsorView(sponsor: sponsor).frame(height: 70)
                }
            }.onAppear{
                Api().getSponsors { sponsorList in
                    sponsors = sponsorList
                }
            }
        }.navigationBarTitle(Text("Sponsors"), displayMode: .inline)
    }
}

struct SponsorsView_Previews: PreviewProvider {
    static var previews: some View {
        SponsorsView()
    }
}
