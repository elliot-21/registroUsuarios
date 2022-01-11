
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtApellidoP: UITextField!
    @IBOutlet weak var txtApellidoM: UITextField!
    @IBOutlet weak var txtCorreo: UITextField!
    @IBOutlet weak var txtTelefono: UITextField!
    @IBOutlet weak var imgPerfil: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    @IBAction func btnAceptar(_ sender: Any) {
        let nombre = txtNombre.text
        let apellidoP = txtApellidoP.text
        let apellidoM = txtApellidoM.text
        let correo = txtCorreo.text
        let telefono = txtTelefono.text
        
        if txtNombre.valida_vacio() || txtApellidoP.valida_vacio() || txtApellidoM.valida_vacio() || txtCorreo.valida_vacio() || telefono!.count != 10 || txtTelefono.valida_vacio()
        {
            Alerta_Mensaje(title: "Aviso", Mensaje: "Favor de llenar todos los campos, Numero de Telefono debe Tener 10 Digitos")
        }else{
            if txtCorreo.isValidEmail(correo!) == false {
                Alerta_Mensaje(title: "Aviso", Mensaje: "Formato de correo Incorrecto")
            }else{
                let RegistroUsuario = RegisterUser()
                RegistroUsuario.RegistroUsuario(Nombre: nombre!, ApellidoP: apellidoP!, ApellidoM: apellidoM!, Correo: correo!, Telefono: telefono!){
                    (exito) in
                    self.Alerta_Mensaje(title: "Aviso", Mensaje: "Registro Correcto")
                    self.LimpiarCampos()
                }fallo: { fallo in
                    self.Alerta_Mensaje(title: "Aviso", Mensaje: "Registro incorrecto")
                }
            }
        }
   
    }
    
    @IBAction func btnCancelar(_ sender: Any) {
        Alerta_Mensaje(title: "Aviso ", Mensaje: "Nos Pone tristes que no te registres :(")
        LimpiarCampos()
    }
    
    func LimpiarCampos(){
        txtNombre.text = ""
        txtApellidoP.text = ""
        txtApellidoM.text = ""
        txtCorreo.text = ""
        txtTelefono.text = ""
    }

}

