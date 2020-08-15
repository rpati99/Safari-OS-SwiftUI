

import SwiftUI

struct HistoryView: View {
    @State var choice = 0
    
    
    var options = ["Bookmarks", "ReadingList" ,"History"]
    
    var body: some View {
        NavigationView{
            VStack{
                Picker(" ", selection: $choice) {
                    ForEach(0 ..< options.count) {
                        index in
                        Text(self.options[index])
                            .tag(index)
                    }
                    
                }
                    
                .pickerStyle(SegmentedPickerStyle())
                Spacer()
            }
            .navigationBarTitle(Text("Search Details⚡️"), displayMode: .inline)
        }

        
    }
    
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}


