window.onload = () => {
    let buttons = document.getElementsByTagName("h2");
    
    function expand(event) {
        if (this.nextElementSibling.style.display == "none") {
            for (let button of buttons) {
                button.nextElementSibling.style.display = "none";
            }
            this.nextElementSibling.style.display = "flex";
        } else {
            this.nextElementSibling.style.display = "none";
        }
    }

    for (let button of buttons) {
        button.nextElementSibling.style.display = "none";
        button.addEventListener('click', expand);
    }
}