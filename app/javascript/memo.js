window.addEventListener('load', ()=>{
  const itemPrice = document.getElementById("item-price");
   itemPrice.addEventListener("input",()=>{
     const inputValue = itemPrice.value;
     const addTaxPrice = document.getElementById("add-tax-price");
     const Profit = document.getElementById("profit");
     addTaxPrice.innerHTML = Math.floor(`${inputValue * 0.1 }`);
     Profit.innerHTML = `${inputValue - Math.floor(inputValue * 0.1) }`;
   });
});
