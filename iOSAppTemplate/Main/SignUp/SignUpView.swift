//
//  SignUpView.swift
//  iOSAppTemplate
//
//  Created by MAC37 on 25/06/22.
//

import SwiftUI

struct SingUpView: View {
    
    @StateObject var authViewModel = AuthViewModel()
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State var alertError = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Registrate")
                    .font(.system(size: 25, weight: .black))
                Text("Bienvenido a Poketinder donde puedes encontrar tu pokemon de preferencia y adoptar uno")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            VStack(spacing: 25) {
                TextField("ingresar nombre", text: $name)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(.pink, lineWidth: 1))
                    .keyboardType(.emailAddress)
                
                TextField("Ingresar email", text: $email)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(.pink, lineWidth: 1))
                    .keyboardType(.emailAddress)
                
                SecureField("Ingresar contraseña", text: $password)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(.pink, lineWidth: 1))
                
                Button {
                    authViewModel.register(name: name, email: email, password: password)
                } label: {
                    Text("Registrarse")
                        .padding()
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .bold))
                }
                .frame(maxWidth: .infinity)
                .background(.pink)
                .cornerRadius(8)
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
}

struct SingUpView_Previews: PreviewProvider {
    static var previews: some View {
        SingUpView()
    }
}
