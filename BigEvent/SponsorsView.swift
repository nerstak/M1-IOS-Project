import SwiftUI

struct SponsorsView: View {
    @State var sponsors : [Sponsor] = []
    
    var body: some View {
        ScrollView {
            // Get the list of sponsors and display each in a view
            VStack(alignment: .center) {
                Text("Sponsors").font(.title)
                ForEach(sponsors) { sponsor in
                    SponsorView(sponsor: sponsor).frame(height: 60)
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
