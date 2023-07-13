const listaVestidos= document.getElementById("vestidoBuscado");
const listaTalles= document.getElementById("talleBuscado");
const listaColores= document.getElementById("colorBuscado");

function obtenerDatos(){
    if(window.location.pathname === '/registro/agregarSalida'){
        $.ajax({
            url:"/vestido/datos",
            method: "GET",
            success:function (datos){
                var arrayDatos=JSON.parse(datos);
                var vestidos=arrayDatos.vestidosSelect;
                var detallesTotales= arrayDatos.detallesConFiltros;

                vestidos.forEach(vestido=>{
                    var option=document.createElement("option");
                    option.classList.add('text-[#B1AC33]','h-[30px]','w-[300px]','hover:border-[#2E2C02]','hover:text-black','hover:bg-[#B1AC33]')
                    option.value=vestido;
                    option.text=vestido;
                    listaVestidos.appendChild(option)
                })

                var colores=[];
                var talles=[];
                listaVestidos.addEventListener("change", function() {
                    for (var i = 0; i < 200; i++) {
                        if (listaVestidos.value === detallesTotales[i]["nombre_vestido"]) {
                            if(!talles.includes(detallesTotales[i]["talle_vestido"])){
                                var option = document.createElement("option");
                                option.classList.add('text-[#B1AC33]', 'h-[30px]', 'w-[300px]', 'hover:border-[#2E2C02]', 'hover:text-black', 'hover:bg-[#B1AC33]')
                                option.value = detallesTotales[i]["talle_vestido"];
                                option.text = detallesTotales[i]["talle_vestido"];
                                listaTalles.appendChild(option)
                                talles.push(detallesTotales[i]["talle_vestido"]);
                            }

                            if(!colores.includes(detallesTotales[i]["color_vestido"])){
                                var option=document.createElement("option");
                                option.classList.add('text-[#B1AC33]','h-[30px]','w-[300px]','hover:border-[#2E2C02]','hover:text-black','hover:bg-[#B1AC33]')
                                option.value=detallesTotales[i]["color_vestido"];
                                option.text=detallesTotales[i]["color_vestido"];
                                listaColores.appendChild(option)
                                colores.push(detallesTotales[i]["color_vestido"]);

                            }

                        }
                    }
                });

            }
        })
    }else{
        $.ajax({
            url:"/vestido/datos",
            method: "GET",
            success:function (datos){
                var arrayDatos=JSON.parse(datos);
                var vestidos=arrayDatos.vestidosSelect;
                var detallesTotales= arrayDatos.detallesTotales;

                vestidos.forEach(vestido=>{
                    var option=document.createElement("option");
                    option.classList.add('text-[#B1AC33]','h-[30px]','w-[300px]','hover:border-[#2E2C02]','hover:text-black','hover:bg-[#B1AC33]')
                    option.value=vestido;
                    option.text=vestido;
                    listaVestidos.appendChild(option)
                })

                var colores=[];
                var talles=[];
                listaVestidos.addEventListener("change", function() {
                    for (var i = 0; i < 200; i++) {
                        if (listaVestidos.value === detallesTotales[i]["nombre_vestido"]) {

                            if(!talles.includes(detallesTotales[i]["talle_vestido"])){
                                var option = document.createElement("option");
                                option.classList.add('text-[#B1AC33]', 'h-[30px]', 'w-[300px]', 'hover:border-[#2E2C02]', 'hover:text-black', 'hover:bg-[#B1AC33]')
                                option.value = detallesTotales[i]["talle_vestido"];
                                option.text = detallesTotales[i]["talle_vestido"];
                                listaTalles.appendChild(option)
                                talles.push(detallesTotales[i]["talle_vestido"]);
                            }

                            if(!colores.includes(detallesTotales[i]["color_vestido"])){
                                var option=document.createElement("option");
                                option.classList.add('text-[#B1AC33]','h-[30px]','w-[300px]','hover:border-[#2E2C02]','hover:text-black','hover:bg-[#B1AC33]')
                                option.value=detallesTotales[i]["color_vestido"];
                                option.text=detallesTotales[i]["color_vestido"];
                                listaColores.appendChild(option)
                                colores.push(detallesTotales[i]["color_vestido"]);
                            }
                        }
                    }
                });
            }
        })
    }
}

$(document).ready(function () {
    obtenerDatos()
});