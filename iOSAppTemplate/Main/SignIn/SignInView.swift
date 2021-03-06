//
//  SignInView.swift
//  iOSAppTemplate
//
//  Created by MAC37 on 25/06/22.
//

import SwiftUI

struct SignInView: View {
    
    @EnvironmentObject var appState: AppState
    
    @StateObject var authViewModel = AuthViewModel()
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State var alertError = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 15) {
                    Text("Bienvenido")
                        .font(.system(size: 25, weight: .bold))
                    Text("Inicia sesión para explorar")
                        .font(.system(size: 20))
                        .frame(maxWidth: 200)
                    
                    VStack(spacing: 25) {
                        TextField("Ingresar email", text: $email)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.pink, lineWidth: 1))
                            .keyboardType(.emailAddress)
                        
                        SecureField("Ingresar contraseña", text: $password)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.pink, lineWidth: 1))
                        
                        Button {
                            authViewModel.login(email: email, password: password)
                        } label: {
                            Text("Inicia sesión")
                                .padding()
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .bold))
                        }
                        .frame(maxWidth: .infinity)
                        .background(.pink)
                        .cornerRadius(8)
                        
                        NavigationLink(destination: SingUpView()) {
                            Text("¿No eres miembro? Registrate")
                        }
                    }
                    .padding()
                    .alert(isPresented: $alertError) {
                        Alert(
                            title: Text("Error"),
                            message: Text(authViewModel.errorMessage),
                            dismissButton: .default(Text("Ok"))
                        )
                    }
                    .onReceive(authViewModel.$showError) { newValue in
                        alertError = newValue
                    }
                }
            }
        }.accentColor(.pink)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
