function recuperar(event){
    event.preventDefault(); // Evita la recarga de la página al enviar el formulario
    
    var email = document.getElementById("email").value;

    if(email !== ""){
        alert("Correo de recuperación enviado, verifique su cuenta de correo electrónico");
        window.location.href="../pages/login.html";
    } else {
        alert("Por favor, ingrese su email.");
    };
};
document.getElementById("form-recup").addEventListener("submit", recuperar);