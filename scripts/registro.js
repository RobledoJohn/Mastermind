function registro(event){
    event.preventDefault(); // Evita la recarga de la página al enviar el formulario
    
    var nombre = document.getElementById("name").value;
    var apellido = document.getElementById("lastn").value;
    var fecha = document.getElementById("date").value;
    var email = document.getElementById("mail").value;
    var documento = document.getElementById("dni").value;
    var identificacion = document.getElementById("numid").value;
    var contraseña = document.getElementById("pass").value;
    var conf_contraseña = document.getElementById("passw").value;

    if(nombre !== "" && apellido !== "" && fecha !== "" && email !== "" && 
    documento !== "" && identificacion !== "" && contraseña !== "" && conf_contraseña !== ""){
        if (contraseña === conf_contraseña) {alert("Cuenta creada, puede loguearse.");
        window.location.href="../pages/login.html";
        }else{
            alert("Las contraseñas no coinciden");
            contraseña = document.getElementById("pass").focus();
        };
    } else {
        alert("Por favor, complete todos los campos.");
    };
};
document.getElementById("form-reg").addEventListener("submit", registro);