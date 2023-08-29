window.addEventListener('turbo:load', () => {
});


const priceInput = document.getElementById("item-price");
console.log(priceInput);

const addTaxDom = document.getElementById("add-tax-price");
const profitDom = document.getElementById("profit");

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log("イベント発火");

  const tax = Math.floor(inputValue * 0.1);
  const profit = inputValue - tax;

  addTaxDom.textContent = `${tax}`; 
  profitDom.textContent = `${profit}`; 
});
