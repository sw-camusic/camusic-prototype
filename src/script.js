window.addEventListener("DOMContentLoaded", () => {
    document.querySelectorAll(".music-play").forEach((value) => {
        value.addEventListener("click", () => {
            document.querySelector(`audio[src="${value.dataset.target}"]`).play();
        });
    });
});
