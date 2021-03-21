//
//  ContentView.swift
//  practice-2
//
//  Created by taisei sumiyama on 2021/03/21.
//

import SwiftUI

struct ContentView: View {
    @State var theDate = Date()
    var dateformate: DateFormatter{
        let df = DateFormatter()
        df.locale = Locale(identifier: "ja_Jp")
        df.dateStyle = .full
        df.timeStyle = .short
        return df
    }
    
    
    var body: some View {
        VStack {
            Text(dateformate.string(from: theDate))
            Divider()
            DatePicker(selection: $theDate, label: { Text("日時") })
                .pickerStyle(WheelPickerStyle())
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
