window.addEventListener('load', () => {
  console.log("OK");
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {

  console.log("イベント発火");

  const inputValue = priceInput.value;
  
  console.log(inputValue);

  const Tax = 0.1;
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.trunc(inputValue * Tax);

  const Taxe = 0.9;
  const addTax = document.getElementById("profit");
  addTax.innerHTML = Math.trunc(inputValue * Taxe);





})
});