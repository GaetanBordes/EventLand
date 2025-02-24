// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
document.addEventListener("DOMContentLoaded", function () {
  console.log("UI Kit chargé !");
  
  // Exemple : Ajouter une animation au chargement des boutons
  document.querySelectorAll(".btn").forEach(btn => {
      btn.addEventListener("mouseover", () => {
          btn.style.opacity = "0.8";
      });
      btn.addEventListener("mouseleave", () => {
          btn.style.opacity = "1";
      });
  });
});
