window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {


  const inputValue = priceInput.value;
  
  const Tax = 0.1;
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.trunc(inputValue * Tax);

  const Taxe = 0.9;
  const addTax = document.getElementById("profit");
  addTax.innerHTML = Math.trunc(inputValue * Taxe);





})
});