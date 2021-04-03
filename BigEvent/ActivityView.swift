import SwiftUI

struct ActivityView: View {
    @State private var activity: Activity

    private var formatter: DateFormatter

    var body: some View {

        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text(activity.fields.activity).font(.title2).fontWeight(.semibold).padding(.bottom, 2)
                // Text(activity.topic).font(.callout)
                Text(activity.fields.type).font(.body)
                HStack(spacing: 10) {
                    Text(activity.fields.locationId[0]).italic()
                    Spacer()
                    Text(activity.fields.start).fontWeight(.light) +
                            Text(" - ") +
                            Text(activity.fields.end).fontWeight(.light)
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
                    //.opacity(formatter.date(from: activity.fields.end)! > Date() ? 1 : 0)
        }.padding(.top, 120)
    }

    init(activity: Activity) {
        formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"

        _activity = State(initialValue: activity)
    }
}
