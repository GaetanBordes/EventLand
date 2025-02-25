// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css";
import { French } from "flatpickr/dist/l10n/fr.js";

document.addEventListener("turbo:load", () => {
  flatpickr(".datepicker", {
    enableTime: true,
    dateFormat: "d-m-Y H:i",
    time_24hr: true,
    theme: "dark"
  });
});

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

