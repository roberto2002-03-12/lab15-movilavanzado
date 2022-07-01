//
//  ProfileView.swift
//  iOSAppTemplate
//
//  Created by MAC37 on 25/06/22.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {

    @EnvironmentObject var appState: AppState

    @State private var email: String = "emilio.contreras@tecsup.edu.pe"
    @State private var name: String = "Emilio Roberto Fabriciano Contreras Gonzales"

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 15) {
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .frame(maxWidth: 100)
                Text(name)
                    .font(.system(size: 26, weight: .black))
                Text(email)
                    .font(.system(size: 18))
                    .foregroundColor(.gray)

                HStack {
                    Button {
                        print("Update Profile")
                    } label: {
                        Text("Editar perfil")
                            .padding()
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                    }
                    .frame(maxWidth: .infinity)
                    .background(.pink)
                    .cornerRadius(8)
                    Spacer()
                    Button {
                        print("Follow")
                    } label: {
                        Text("Seguir")
                            .padding()
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                    }
                    .frame(maxWidth: .infinity)
                    .background(.gray)
                    .cornerRadius(8)
                }

                Spacer()

                VStack {
                    Divider()
                    Button {
                        try? Auth.auth().signOut()
                        appState.currentScreen = .signIn
                    } label: {
                        Text("Cerrar sesión")
                            .foregroundColor(.pink)
                    }
                }.padding(.bottom)

            }.padding()
            .navigationTitle("Profile")
        }
        .onAppear {
            let user = Auth.auth().currentUser
            name = user?.displayName ?? "not name"
            email = user?.email ?? "no email"
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
