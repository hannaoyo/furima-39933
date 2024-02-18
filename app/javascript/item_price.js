const price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const ProfitDom = document.getElementById("profit");
    //販売手数料 (10%)
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    //販売利益
    ProfitDom.innerHTML = inputValue - addTaxDom.innerHTML;
  })
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);