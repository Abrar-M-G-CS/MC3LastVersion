//
//  LoginView.swift
//  MC3LastVersion
//
//  Created by Abrar Ghandurah on 23/07/1445 AH.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    
//MARK: Creating Variables
    
    @State private var email = ""
    @State private var password = ""
    
    
    var body: some View {
        NavigationStack{
            VStack{

                
//MARK: Adding Logo
                //Image
                Text("Logo")
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 120)
                    .padding(.vertical ,32)
                
                
//MARK: Form Fields
                
                //form fields
                VStack(spacing: 24){
                    InputView(text: $email, title: "Email Address", placeHolder: "name@example.com")
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    InputView(text: $password, title: "Password", placeHolder: "Enter your password", isSecureField: true)
                }//vstack
                .padding(.horizontal)
                .padding(.top,12)
                
                //sign in button
                Button{
                    print("Log user in..")
                } label: {
                    
                    HStack{
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }//HStack
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32 , height: 47)
                }//label of button
                .background(Color(.customBackground))
                .cornerRadius(5)
                .padding(.top,28)
                .padding(.vertical)

                HStack{
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2 ) - 40  , height: 0.5)
                        .foregroundColor(.gray)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40 , height: 0.5)
                        .foregroundColor(.gray)

                }//HStack
                

                //MARK: Sign-in with Apple
                SignInWithApple()
                Spacer()
                
                //sign up button
                NavigationLink{
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                }label: {
                    HStack(spacing: 3){
                        Text("Don't have an account ?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }//HStack
                    .font(.system(size: 14))
                    .accentColor(.customBackground)
                    
                    
                }//Label
            }//vstack
        }//navigationStack
    }//Body
}//LoginView

#Preview {
    LoginView()
}
