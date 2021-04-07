import SwiftUI


/// Custom structure to store activities having same date (dayMonthYear)
struct ActivitiesAt{
    let date: String
    let activities: [Activity]
}


/// View of calendar
struct CalendarView: View {
    // Note: we cannot use Dictionnary, as they are unordered Collections, thus the custom struct in an Array
    @State var schedules: [ActivitiesAt] = []
    private var df = DateForm()
    let weekFormatter = DateFormatter()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // For each day
                    ForEach(schedules, id: \.date) { day in
                        let stringDate = weekFormatter.string(from: df.simpleDateFormatter.date(from: day.date)!)
                            + " - " + day.date
                        
                        Divider()
                        
                        Text(stringDate).font(.title)
                        
                        // For each activity
                        ForEach(day.activities) { a in
                            NavigationLink(destination: DetailsView(activity: a, title: stringDate)) {
                                                            ActivityView(activity: a).padding().frame(height: 150)
                                                        }
                                                        .buttonStyle(PlainButtonStyle())

                        }
                    }
                }
                .onAppear {
                    Api().getSchedules {schedule in
                        // We sort activities at first, so we don't to do it in subarrays
                        let tmp = schedule.sorted {
                            df.convertToDate(string: $0.fields.start)  < df.convertToDate(string: $1.fields.start)
                        }
                        
                        // We check every activity
                        for activity in tmp {
                            // Generating key
                            let key = df.convertToSimpleDate(string: activity.fields.start)
                            
                            // Checking if key is already inside array
                            let search = schedules.filter { elt in
                                return elt.date == key
                            }
                            
                            if search.count == 0 {
                                // If key not present, we gather every element having the same key and add them to inner array
                                let elements = tmp.filter { a in
                                    return df.convertToSimpleDate(string: a.fields.start) == key
                                }
                                schedules.append(ActivitiesAt(date: key, activities: elements))
                            }
                        }
                    }
                }
            }.padding(.bottom, 10)
            .navigationBarTitle(Text("Calendar"), displayMode: .inline)
        }
    }
    
    init() {
        weekFormatter.dateFormat = "EEEE"
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
