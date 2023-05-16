window.addEventListener('load', () => {
    const priceInput = document.getElementById("item-price");
    const taxOutput = document.getElementById("add-tax-price");
    const profitOutput = document.getElementById("profit");

    priceInput.addEventListener("input", () => {
        const inputValue = priceInput.value;
        const outputTax = Math.floor(inputValue * 0.1);
        const outputProfit = Math.floor(inputValue - outputTax);
        taxOutput.innerHTML = outputTax;
        profitOutput.innerHTML = outputProfit;
    })
});