const price = () => {

window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = (inputValue * 0.1);
  const addSalesProfit =  document.getElementById("profit");
  addSalesProfit.innerHTML = Math.floor(inputValue - (inputValue * 0.1));
  });
});

};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);