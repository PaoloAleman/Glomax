const menuIcon=document.getElementById('menuIcon');
const menu=document.getElementById('menu');
const main=document.getElementById('main');
let contadorClicksMenu=0;

menuIcon.addEventListener("click",()=>{
    contadorClicksMenu++;
    if(contadorClicksMenu % 2 ===0){
        menuIcon.classList.remove('border-r-4','rounded-tr-3xl','border-[#B1AC33]');
        menu.style.display="none";
    }else{
        menuIcon.classList.add('border-r-4','border-[#B1AC33]','rounded-tr-3xl');
        menu.style.display="block";
    }
});

main.addEventListener("click",()=> {
    menuIcon.classList.remove('border-r-4','rounded-tr-3xl','border-[#B1AC33]');
    menu.style.display="none";
});
