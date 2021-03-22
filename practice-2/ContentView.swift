//
//  ContentView.swift
//  practice-2
//
//  Created by taisei sumiyama on 2021/03/21.
//

import SwiftUI

struct ContentView: View {
    @State var theDate = Date()
    @State var name: String = ""
    var dateformate: DateFormatter{
    let df = DateFormatter()
        df.locale = Locale(identifier: "ja_Jp")
        df.dateStyle = .full
        df.timeStyle = .short
        return df
    }
    @State var kosu:String = ""
    let tanka: Double = 250
    let tax: Double = 1.1
    
    
    var body: some View {
//        VStack {
        ///dateピッカー
//            Text(dateformate.string(from: theDate))
//            Divider()
//            DatePicker(selection: $theDate, label: { Text("日時") })
//                .pickerStyle(WheelPickerStyle())
//        }
//        .padding()
        ///テキストフィールド　名前入力
//        TextField("お名前は?", text: $name)
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//            .frame(width: 250)
//        if(!name.isEmpty){
//            Text("\(name)さん、こんにちは！")
//        }
        ///テキストフィールド
        VStack (alignment: .leading){
            HStack {
                Text("個数:")
                    .padding(.horizontal,0)
                TextField("0", text: $kosu)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .frame(width: 100)
            }
            .font(.title)
            .frame(width: 200)
            
            Group{
                if kosuCheck(min: 1, max: 10){
                        Text("\(price())円です。")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }else{
                    Text("個数は1から10を入れてください。")
                        .foregroundColor(.red)
                        .font(.headline)
                }
            }.frame(width: 300, height: 30)
        }
        .position(x:200, y:200)
    }
    func kosuCheck(min:Int, max:Int) -> Bool{
        guard let num = Int(kosu) else{
            return false
        }
        return (num>=min && num<=max)
    }
    
    func price() -> Int{
        if let num = Double(kosu){
            let result = Int(tanka * num * tax)
            return result
        } else {
            return -1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
