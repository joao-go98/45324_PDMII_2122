//
//  ContentView.swift
//  listadoscontactos
//
//  Created by Goncalo Pinto on 29/06/2022.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var taskStore = TaskStore()
    
    @State var novo : String = ""
    @State var telele : String = ""
    @State var eumail : String = ""
    @State private var searchText = ""
    @State private var showText = false
    func falso() {showText = false}
    func vdd() {showText = true}
    var view = DetailView(nome: "", num: "", elemail: "", fotozin: .defImg)
    
    var searchBar: some View{
        VStack{
            TextField("Adicionar Nome", text: self.$novo).padding(7)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1))
            .accentColor(.orange)
            
            TextField("Adicionar Numero", text: self.$telele).padding(7)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1))
            .accentColor(.orange)

            TextField("Adicionar Email", text: self.$eumail).padding(7)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1))
            .accentColor(.orange)
            
            Button(action: self.addnovo, label: {
                Text("Adicionar Contacto")
            }).padding(7)
                .accentColor(.orange)
        }
          
    }
    
    func addnovo() {
            taskStore.tasks.append(Task(id: String(taskStore.tasks.count + 1), todo: novo, tlm: telele, email: eumail, foto: "foto_0"))
            self.novo = ""
            self.telele = ""
            self.eumail = ""
    }
    
    func move(from source: IndexSet, to destination: Int)
    {taskStore.tasks.move(fromOffsets: source, toOffset: destination)}
    
    func delete(at offsets : IndexSet){taskStore.tasks.remove(atOffsets: offsets)}
    
    var body: some View {
        
        NavigationView{
            VStack{
                if showText{
                    searchBar.padding()
                }
                List{
                        ForEach(self.taskStore.tasks)
                        {
                            task in
                            
                            if searchText.isEmpty{
                                
                                NavigationLink(destination:DetailView(nome: task.todo, num: task.tlm, elemail: task.email, fotozin: task.foto)){
                                        HStack{
                                            Image(uiImage: task.foto)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 40, height: 40)
                                                .clipShape(Circle())
                                            VStack(alignment: .leading){
                                                Text(task.todo)
                                            }
                                        }
                                }
                            }
                            
                            if(searchText == task.todo)
                            {
                                NavigationLink(destination:DetailView(nome: task.todo, num: task.tlm, elemail: task.email, fotozin: task.foto)){
                                        HStack
                                        {
                                            Image(uiImage: task.foto)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 40, height: 40)
                                                .clipShape(Circle())
                                            
                                            VStack(alignment: .leading)
                                            {
                                                Text(task.todo)
                                            }
                                        }
                                }
                            }
                            
                        }.onMove(perform: self.move).onDelete(perform: self.delete)
                    }.searchable(text: $searchText)
                    //.environment(\.colorScheme, .dark)
                    .navigationTitle("Lista de Contactos")
                        .navigationBarItems(leading: EditButton(), trailing:
                        Menu("Adicionar")
                        {
                            Button("Fecha", action: falso)
                            Button("Abre", action: vdd)
                        })
                        .accentColor(.orange)
                
            }
            
        }
        
    }
        
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


