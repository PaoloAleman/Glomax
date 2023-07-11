const filtro=document.getElementById("vestidoBuscado");

var datos={
    vestido: filtro.value
};

$.ajax({
    url:"/vestido/filtro",
    method:"POST",
    data: JSON.stringify(datos),
    contentType:'application/json',
})
