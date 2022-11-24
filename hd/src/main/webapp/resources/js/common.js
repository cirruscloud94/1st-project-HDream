document.addEventListener("scroll", function(){
    let header = document.getElementsByTagName("header")[0];
    if (window.scrollY > 0) { header.classList.add("on"); } else { header.classList.remove("on"); }
});