function loguearse(event){
    event.preventDefault(); // Evita la recarga de la página al enviar el formulario
    
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;

    if(email !== "" && password !== ""){
        window.location.href="../pages/prueba.html";
    } else {
        alert("Por favor, complete todos los campos.");
    };
};
document.getElementById("form-login").addEventListener("submit", loguearse);