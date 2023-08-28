window.addEventListener('turbo:load', () => {
  console.log("OK");
});


const priceInput = document.getElementById("item-price");
console.log(priceInput);

const addTaxDom = document.getElementById("add-tax-price");
const profitDom = document.getElementById("profit");

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log("イベント発火");

  // 販売手数料（税）計算
  const tax = Math.floor(inputValue * 0.1);
  // 販売利益計算
  const profit = inputValue - tax;

  // 販売手数料を表示
  addTaxDom.textContent = `${tax}`; // innerHTML を textContent に修正
  // 販売利益を表示
  profitDom.textContent = `${profit}`; // innerHTML を textContent に修正
});

// const priceInput = document.getElementById("item-price");
// priceInput.addEventListener("input", () => {
//    const inputValue = priceInput.value;
//    console.log(inputValue);
// })
