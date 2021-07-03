// window.onload = (event) => {
console.log("Admin Reload...");

const adminPart = document.querySelectorAll(".admin-part");
const btnOptions = document.querySelectorAll(".options");

const hideAll = () => {
  for (let i = 0; i < adminPart.length; i++) {
    adminPart[i].style.display = "none";
  }
};

for (let i = 0; i < btnOptions.length; i++) {
  btnOptions[i].addEventListener("click", () => {
    hideAll();
    adminPart[i].style.display = "block";
  });
}

const init = () => {
  hideAll();
  adminPart[0].style.display = "block";
};

init();

// };
