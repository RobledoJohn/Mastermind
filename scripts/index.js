function enviar_form(event) {
    event.preventDefault(); // Evita la recarga de la página al enviar el formulario
    var nombre = document.getElementById("nombre").value.trim();
    var asunto = document.getElementById("asunto").value;
    var descripcion = document.getElementById("desc").value;

    var mensaje = "Hola! mi nombre es " + nombre;

    //Validar que sea texto
    const textoValido=/^[a-zA-Z ]*$/;

    //alertas
    function alerta(titulo,mensaje,tipo){
        Swal.fire({
            title: titulo,
            text: mensaje,
            icon: tipo
          });
    }
    function correoEnviado(){
        Swal.fire({
            icon: "success",
            title: "Enviado con éxito",
            showConfirmButton: false,
            timer: 1500
          });
    }

    if (nombre !== "" && asunto !== "" && descripcion !== "") {
        correoEnviado();
        window.location.href ="mailto:jjrobledo22@soy.sena.edu.co?subject=" + encodeURIComponent(asunto) + "&body="+encodeURIComponent(mensaje + "\n \n" + descripcion);
    } else {

        //Validar campo vacio
        if(nombre.trim()==""){
            alerta("Escriba un nombre","¡Complete todos los campos!","error");
            nombre.focus();
            return false;
        }//Validar que sea texto
            else if(!nombre.match(textoValido)){
                alerta("Escriba un nombre válido","No puede tener números","error");
                nombre.focus();
                return false;
        }
        //Validar campo vacio
        if(asunto.trim()==""){
            alerta("Escriba un asunto","¡Complete todos los campos!","error");
            asunto.focus();
            return false;
        }
        //Validar campo vacio
        if(descripcion.trim()==""){
            alerta("Escriba una descripción","¡Complete todos los campos!","error");
            descripcion.focus();
            return false;
        }
    };



    






/*  formulario funcional
    var nombre = document.getElementById("nombre").value;
    var asunto = document.getElementById("asunto").value;
    var descripcion = document.getElementById("desc").value;

    var mensaje = "Hola! mi nombre es " + nombre;


    if (nombre !== "" && asunto !== "" && descripcion !== "") {
        alert("Correo Generado con éxito!");
        window.location.href ="mailto:jjrobledo22@soy.sena.edu.co?subject=" + encodeURIComponent(asunto) + "&body="+encodeURIComponent(mensaje + "\n \n" + descripcion);
    } else {
        alert("Por favor, complete todos los campos.");
     
    };*/
}

document.getElementById("formulario_index").addEventListener("submit", enviar_form); //carga el formulario al oprimir el boton submit
