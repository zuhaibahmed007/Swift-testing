//
//  Login.swift
//  Qesh-swift
//
//  Created by Amir Khan on 05/12/2023.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var isLoggedIn : Bool
    
    @State private var email: String = ""
    @State private var password: Number = ""
    
    
    
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView(showsIndicators: false){
                    VStack {
                        Image("LoginBanner")
                            .padding()
                    }
                    
                    VStack(alignment: .leading, content: {
                            Typography(text: "Wellcome Back", fontSize: 25, customFontName: "Inter-Black", bottomPadding: 7)
                            
                            Typography(text: "Lorem ipsum dolor sit amet Lorem ipsum\ndolor sit amet" ,textColor: "Secondary", fontSize: 12)
                            
                            VStack {
                                InputField(text: $email, placeholder: "Email")
                                PasswordField(text: $password, placeholder: "Password")
                            }
                            .padding(.top, 20)
                            .padding(.bottom, 0)
             
                            VStack{
                                NavigationLink(destination: ForgotPasswordView()) {
                                Typography(text: "Forgot Password?", textColor: "Primary", fontSize: 14, textAlignment: .trailing, bottomPadding: 40)
                                }
                            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                        
                            
                            Spacer()
                            
                            PrimaryButton(text: "Sign In", callBack: {
                                isLoggedIn = true
                            })
                            HStack{
                                Rectangle()
                                    .foregroundColor(Color("LightV1"))
                                    .frame( height: 2)
                                
                                Typography(text: "OR" , textColor: "Secondary", fontSize: 18, customFontName: "Inter-SemiBold" )
                                    .frame(maxWidth: 30, alignment: .center)
                                
                                Rectangle()
                                    .foregroundColor(Color("LightV1"))
                                    .frame(height: 2)
                            }.padding(
                                .init(top: 25, leading: 0, bottom: 25, trailing: 0))
                        NavigationLink(destination: SignUpView(),label: {
                            PrimaryButton(text: "Sign Up", bgColor: "Dark", isDisabled: true)
                        })
                    })
                }.padding(.horizontal, 18)
            }
        }.navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    LoginView()
//}
