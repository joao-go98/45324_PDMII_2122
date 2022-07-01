//
//  DetailView.swift
//  listadoscontactos
//
//  Created by Goncalo Pinto on 30/06/2022.
//

import SwiftUI

struct DetailView: View {
    let nome: String
    let num: String
    let elemail: String
    let fotozin: UIImage
    
    var body: some View {
        
            List{
                
                VStack{
                    Text("Nome: \(nome)").font(.system(size: 40)).padding([.leading], 50).padding([.top], 50)
                    Text("Email: \(elemail)").font(.system(size: 40)).padding([.leading], 50)
                        .padding([.top], 5)
                    
                }.padding([.bottom], 50)
                Section
                {
                    NavigationLink(destination: Viewdeteste(nomez: nome, numz: num, emailz: elemail, fotoz: fotozin))
                    {Text("\(num) 📞").font(.system(size: 30))}
                }
            }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(nome: "", num: "", elemail: "", fotozin: .defImg)
    }
}
