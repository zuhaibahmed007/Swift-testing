import SwiftUI

struct WellcomeView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView{
                    VStack {
                        Image("WellcomeBanner")
                            .padding()
                    }
                    VStack(alignment: .leading, content: {
                        Typography(text: "Attendance Tracking", fontSize: 48, customFontName: "Inter-Bold", bottomPadding: 14)
                        
                        Typography(text: "Lorem ipsum dolor sit amet consectetur. Gravida lobortis viverra sodales sapien eu..", textColor: "Secondary", fontSize: 14)
                        
                        Spacer()
                        
                    })
                }
                
                NavigationLink(destination: LoginView(isLoggedIn: $isLoggedIn)){
                    PrimaryButton(text: "Login", bottomPadding: 15, isDisabled: true)
                }
                
                NavigationLink(destination: SignUpView()){
                    PrimaryButton(text: "Sign Up", bgColor: "Dark", bottomPadding: 15, isDisabled: true)
                }
                
                
            }.padding(.horizontal, 18)
        }.navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    
//    WellcomeView()
//}

