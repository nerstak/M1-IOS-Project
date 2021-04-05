import SwiftUI


/// Activity and its main informations
struct ActivityView: View {
    @State private var activity: Activity
    @State private var topic: String = ""
    @State private var location: String?;

    private var df = DateForm()

    init(activity: Activity) {
        _activity = State(initialValue: activity)
    }

    var body: some View {

        GeometryReader { geometry in
            VStack(alignment: .leading) {
                // Name of activity
                Text(activity.fields.activity).font(.title2).fontWeight(.semibold).padding(.bottom, 2)

                // Topic (blank if none)
                Text(topic).font(.callout)
                        .onAppear {
                            if let topics = activity.fields.topics {
                                Api().getTopics(idTopic: topics[0]) { t in
                                    self.topic = t
                                }
                            }
                        }

                // Type of activity (correspond to color too!)
                Text(activity.fields.type).font(.body)

                HStack(spacing: 10) {
                    Text(location ?? "").italic().onAppear {
                        Api().getLocation(idLocation: activity.fields.locationId[0]) { l in
                            self.location = l.fields.spaceName
                        }
                    }
                    Spacer()
                    Text(df.convertToHoursMinutes(string: activity.fields.start)).fontWeight(.light) +
                            Text(" - ") +
                            Text(df.convertToHoursMinutes(string: activity.fields.end)).fontWeight(.light)
                }
            }
                    // Styling our box 😎
                    .padding()
                    // Color matching type of activity
                    .background(activity.fields.getColor().opacity(0.8))
                    .cornerRadius(15.0)
                    .padding(.all, 10)

            // ZStack for small notification "Live"
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).foregroundColor(.red)

                Text("Live").foregroundColor(.white)
            }
                    .frame(width: 40, height: 15)
                    .offset(x: geometry.size.width - 40, y: 5)
                    // We only display notification "Live" if we are between end & start date
                    .opacity(df.convertToDate(string: activity.fields.end) > Date() &&
                            df.convertToDate(string: activity.fields.start) < Date()
                            ? 1 : 0)
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        let df = DateForm()
        let now = Date()
        let a = ActivityFields(topics: ["Wood & Steel"], type: "Workshop", activity: "Workshop for security novices", start: df.convertToString(date: now.addingTimeInterval(-3600)), end: df.convertToString(date: now.addingTimeInterval(3600)), locationId: ["Emerald Room"], speakerIds: ["0"])

        ActivityView(activity: Activity(id: "0", fields: a))
    }
}
