//
//  modelo.swift
//  listadoscontactos
//
//  Created by Goncalo Pinto on 29/06/2022.
//

import Foundation

class modelo:ObservableObject{
    
    @Published var listPessoas:[Task] = []
    
    func addPessoa(nome:String, idade:String, foto:String){
        let p = Task(id: nome, todo: idade, foto: foto)
        self.listPessoas.append(p)
    }
    
    
    init(){
        for a in 0 ... 2{
            let p = Task(id: "Nome_", todo: ("\(a)"), foto: "foto_\(a)")
            self.listPessoas.append(p)
        }
        
    }
    
}
