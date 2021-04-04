import SwiftUI

struct ActivityView: View {
    @State private var activity: Activity
    private var df = DateForm()

    var body: some View {

        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text(activity.fields.activity).font(.title2).fontWeight(.semibold).padding(.bottom, 2)
                // Text(activity.topic).font(.callout)
                Text(activity.fields.type).font(.body)
                HStack(spacing: 10) {
                    Text(activity.fields.locationId[0]).italic()
                    Spacer()
                    Text(df.convertToHoursMinutes(string: activity.fields.start)).fontWeight(.light) +
                            Text(" - ") +
                            Text(df.convertToHoursMinutes(string: activity.fields.end)).fontWeight(.light)
                }
            }.padding()
                    .background(activity.fields.getColor().opacity(0.8))
                    .cornerRadius(15.0)
                    .padding(.all, 10)

            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).foregroundColor(.red)

                Text("Live").foregroundColor(.white)
            }
                    .frame(width: 40, height: 15)
                    .offset(x: geometry.size.width - 40, y: 5)
                    .opacity(df.convertToDate(string: activity.fields.end) > Date() &&
                                df.convertToDate(string: activity.fields.start) < Date()
                        ? 1 : 0)
        }
    }

    init(activity: Activity) {
        _activity = State(initialValue: activity)
        print(Date())
        print(activity.fields.end)
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        let df = DateForm()
        let now  = Date()
        let a = ActivityFields(topics: ["Wood & Steel"], type: "Workshop",activity: "Workshop for security novices", start: df.convertToString(date: now.addingTimeInterval(-3600)) , end:  df.convertToString(date: now.addingTimeInterval(3600)), locationId: ["Emerald Room"],speakerIds: ["0"])
        
        ActivityView(activity: Activity(id: "0", fields: a))
    }
}
