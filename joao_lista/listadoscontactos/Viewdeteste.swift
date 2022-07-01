//
//  Viewdeteste.swift
//  listadoscontactos
//
//  Created by Developer on 01/07/2022.
//

import SwiftUI

struct Viewdeteste: View {
    
    let nomez: String
    let numz: String
    let emailz: String
    let fotoz: UIImage
    var m = ContentView()
    
    var body: some View {
        
            List{
                
                Section{Text("A Ligar... \(nomez)").bold().font(.system(size: 30)).padding([.leading], 50)}
                
                VStack{
                    Image(uiImage: fotoz)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 250, height: 250)
                        .clipShape(Circle())
                        .padding([.leading], 30)
                }.padding()
                
                Section{Text("Desligar").bold().font(.system(size: 25)).padding([.leading], 130).foregroundColor(.red)}
                
            }.environment(\.colorScheme, .dark)
        
        
    }
    
    
}

struct Viewdeteste_Previews: PreviewProvider {
    static var previews: some View {
        Viewdeteste(nomez: "", numz: "", emailz: "", fotoz: .defImg)
            .environment(\.colorScheme, .dark)
        
    }
}
