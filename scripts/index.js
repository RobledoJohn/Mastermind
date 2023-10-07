function enviar_form(event) {
    event.preventDefault(); // Evita la recarga de la página al enviar el formulario
    
    var nombre = document.getElementById("nombre").value;
    var asunto = document.getElementById("asunto").value;
    var descripcion = document.getElementById("desc").value;

    var mensaje = "Hola! mi nombre es " + nombre;
    
    if (nombre !== "" && asunto !== "" && descripcion !== "") {
        alert("Correo Generado con éxito!");
        window.location.href ="mailto:jjrobledo22@soy.sena.edu.co?subject=" + encodeURIComponent(asunto) + "&body="+encodeURIComponent(mensaje + "\n \n" + descripcion);
    } else {
        alert("Por favor, complete todos los campos.");
    };
}

document.getElementById("formulario_index").addEventListener("submit", enviar_form);
