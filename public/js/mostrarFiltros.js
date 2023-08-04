const botonFiltros=document.getElementById("mostrarFiltros");
const popUpFiltros=document.getElementById("popUpFiltros");
const cerrarPopUp=document.getElementById("cerrarPopUp");

botonFiltros.addEventListener("click",()=>{
        popUpFiltros.classList.remove("hidden");
});

cerrarPopUp.addEventListener("click",()=>{
    popUpFiltros.classList.add("hidden");

})