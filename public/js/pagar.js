const botonPago=document.getElementById("pagar");
const popUpPago=document.getElementById("popUpPago");
const cerrarPopUp=document.getElementById("cerrarPopUp");

botonPago.addEventListener("click",()=>{
    popUpPago.style.display="block";
    cerrarPopUp.addEventListener("click",()=>{
        popUpPago.style.display="none";

    })
})