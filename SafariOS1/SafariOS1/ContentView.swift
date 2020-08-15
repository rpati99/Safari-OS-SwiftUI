

import SwiftUI

struct ContentView: View {
       @State private var isShareSheetShowing = false
    
    let fileUrl = Bundle.main.url(forResource: "Apple", withExtension: "pdf")
    
    
    var body: some View {
        NavigationView{
            
                 VStack{
                     HStack{
                      
                        Text("Favourites").font(.title).fontWeight(.heavy).padding(10)
                        Spacer()
                     }
                     HStack{
                         VStack{
                            NavigationLink(destination: PDFKitView(url: self.fileUrl!)) {
                                Image("appleLogo").renderingMode(.original)
                                
                            }
                            Text("Apple")
                           
                         }
                         
                         .padding(15)
                         VStack{
                            NavigationLink(destination: WWDCView()) {
                                Image("appleLogo").renderingMode(.original)
                               
                            }
                             Text("WWDC")
                        
                       
                         }
                        Spacer()
                     }
                    
                    Spacer()
                    
                     HStack{
                         Image(systemName: "chevron.left").font(.largeTitle).padding(10)
                         
                         
                         Spacer()
                         
                         
                         Image(systemName: "chevron.right").font(.largeTitle)
                         
                         
                         Spacer()
                        Button(action: shareButton) {
                               Image(systemName: "square.and.arrow.up").font(.largeTitle)
                        }
                      
                         
                         Spacer()
                        NavigationLink(destination: HistoryView()) {
                              Image(systemName: "book").font(.largeTitle)
                        }
                       
                         
                         Spacer()
                        NavigationLink(destination: TabsView()) {
                            Image(systemName: "square.on.square").font(.largeTitle).padding(10)
                        }
                         
                         
                     }
                 }//VStack finishes
                 .navigationBarTitle(Text("🔍SafariOS"), displayMode: .inline)
             }
             
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension ContentView {
    func shareButton() {
        isShareSheetShowing.toggle()
        
        let url = URL(string: "https://apple.com")
        let av = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
        
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }

}
