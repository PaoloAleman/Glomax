const mostrarTablaBtn=document.getElementById("mostrarTable");
const tabla=document.getElementById("tabla");
let contadorClics=0;
mostrarTablaBtn.addEventListener("click",()=>{
    contadorClics++;
    if(contadorClics % 2===0){
        tabla.style.display = 'none';
    }else {
        tabla.style.display = 'table';
    }
});