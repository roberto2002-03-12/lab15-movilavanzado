//
//  HomeButtonView.swift
//  iOSAppTemplate
//
//  Created by MAC37 on 10/06/22.
//

import SwiftUI

struct HomeButtonView: View {
    
    var imageName = ""
    
    var body: some View {
        //crear un componente que reciba nombre de la imagen y en base a ella crear un boton
        VStack {
            Button {
                print("Like")
            } label: {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(maxWidth: 80, maxHeight: 80)
        }
    }
}

struct HomeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HomeButtonView(imageName: "dislike-button")
    }
}
