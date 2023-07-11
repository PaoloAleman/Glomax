const menuIcon=document.getElementById('menuIcon');
const menu=document.getElementById('menu');
const imgMenu=document.getElementById('imgMenu');

let contadorClicks=0;

menuIcon.addEventListener("click",()=>{
    contadorClicks++;
    if(contadorClicks % 2 ===0){
        menuIcon.style.backgroundColor="black"
        menu.style.display="none";
        imgMenu.setAttribute("src","/public/iconos/menuIcon.png")
    }else{
        menu.style.display="block";
        menuIcon.style.backgroundColor="#B1AC33"
        imgMenu.setAttribute("src","/public/iconos/menuIconBlack.png")
    }
});