import Foundation
import FirebaseFirestore
import FirebaseStorage
import UIKit

class RegisterUser{
    
private let db = Firestore.firestore()

    func RegistroUsuario(Nombre: String, ApellidoP: String,ApellidoM: String ,Correo: String,Telefono: String,exito: @escaping (_ exito: String) ->() ,fallo: @escaping (_ fallo: String) ->() ){
    
   
    self.db.collection("Usuarios").document(Correo).setData(["Nombre":Nombre,"Apellido P": ApellidoP,"Apellido M": ApellidoM, "Telefono": Telefono]){
        (error) in
        if   error == nil {
            exito("Registro Exitoso")
        }else{
            fallo("Registro fallido")
        }
    }
        
  
   
    }
    
}
    

