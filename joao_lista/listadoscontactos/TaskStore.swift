//
//  informa.swift
//  listadoscontactos
//
//  Created by Goncalo Pinto on 29/06/2022.
//

import Foundation
import SwiftUI
import Combine

struct Task: Identifiable {
    var id = String()
    var todo = String()
    var tlm = String()
    var email = String()
    var foto = UIImage()
    
    init(id:String, todo:String, tlm:String, email:String, foto:String){
        self.id = id
        self.todo = todo
        self.tlm = tlm
        self.email = email
        self.foto = UIImage(named: foto) ?? .defImg
    }
    
    
}


class TaskStore: ObservableObject{
    @Published var tasks = [Task]()
    
    init(){
        for a in 0 ... 2{
            let p = Task(id: ("\(a)"), todo: "Fazer \(a)", tlm: "96\(a)", email: "email\(a)", foto: "foto_\(a)")
            self.tasks.append(p)
        }
        
    }
}

extension UIImage{
    
    static var defImg:UIImage{
        UIImage(named: "noImg")!
    }
    
}
