
document.addEventListener("DOMContentLoaded", function () {
    const toggle = document.getElementById("recomendados-toggle");
    const section = document.getElementById("recomendados-section");

    if (!toggle || !section) {
        console.error("Error: No se encontró 'recomendados-toggle' o 'recomendados-section'");
        return;
    }

    console.log("Script cargado, elementos encontrados");

    toggle.addEventListener("click", function () {
        console.log("Clic en la imagen superpuesta");
        if (section.style.display === "block") {
            section.style.display = "none";
        } else {
            section.style.display = "block";
        }
    });
});