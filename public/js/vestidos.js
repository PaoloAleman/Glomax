const listaVestidos= document.getElementById("vestidoBuscado");
const listaTalles= document.getElementById("talleBuscado");
const listaColores= document.getElementById("colorBuscado");

function obtenerDatos(){
    $.ajax({
        url:"/vestido/datos",
        method: "GET",
        success:function (datos){
            var arrayDatos=JSON.parse(datos);
            var vestidos=arrayDatos.vestidosSelect;
            var colores=arrayDatos.colores;
            var talles=arrayDatos.talles;
            vestidos.forEach(vestido=>{
                var option=document.createElement("option");
                option.classList.add('text-[#B1AC33]','h-[30px]','w-[300px]','hover:border-[#2E2C02]','hover:text-black','hover:bg-[#B1AC33]')
                option.value=vestido;
                option.text=vestido;
                listaVestidos.appendChild(option)
            })

            colores.forEach(color=>{
                var option=document.createElement("option");
                option.classList.add('text-[#B1AC33]','h-[30px]','w-[300px]','hover:border-[#2E2C02]','hover:text-black','hover:bg-[#B1AC33]')
                option.value=color;
                option.text=color;
                listaColores.appendChild(option)
            })

            talles.forEach(talle=>{
                var option=document.createElement("option");
                option.classList.add('text-[#B1AC33]','h-[30px]','w-[300px]','hover:border-[#2E2C02]','hover:text-black','hover:bg-[#B1AC33]')
                option.value=talle;
                option.text=talle;
                listaTalles.appendChild(option)
            })
        }
    })
}

$(document).ready(function () {
    obtenerDatos()
});