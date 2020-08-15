
import SwiftUI

struct WWDCView: View {
    @State var showText: Bool = false
       var body: some View {
           ZStack{
               Image("wwdc")
               .resizable()
                   .aspectRatio(contentMode: .fill)
                   .edgesIgnoringSafeArea(.bottom)
               
               VStack{
                   Spacer()
                   if showText{
                       Text("YAY! I APPLIED 🤩")
                           .font(.title)
                           .fontWeight(.heavy)
                           .foregroundColor(Color.orange)
                         
                          
                       

                   }//end of if statement
               
                   Button(action: {
                       withAnimation(.spring(response: 1.0, dampingFraction: 1.0, blendDuration: 1.0)) {
                           self.showText = true
                       }
                   }) {
                       Text("Apply Now")
                           .font(.largeTitle)
                           .fontWeight(.regular)
                           .foregroundColor(Color.white)
                           .background(
                                              RoundedRectangle(cornerRadius: 20, style: .continuous).fill(
                                                  LinearGradient(gradient: Gradient(colors: [.pink, .blue]),
                                                                 startPoint: .leading,
                                                                 endPoint: .trailing
                                              )))
                       .padding(25)
                       
                   }//end of button
               }//end of vStack
               
           }//end of ZStack
       }
}

struct WWDCView_Previews: PreviewProvider {
    static var previews: some View{
        WWDCView()
    }
}



