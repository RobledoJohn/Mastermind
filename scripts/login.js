var email = document.getElementById("email");
var password = document.getElementById("password");

var boton = document.getElementById("botonLog")

boton.addEventListener("clic", function(){
    alert("sesion iniciada");
    console.log(email + "," + password);
});