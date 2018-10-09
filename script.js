window.addEventListener("DOMContentLoaded", () => {
    navigator.mediaDevices.getUserMedia({
        audio: false,
        video: {
            facingMode: "environment",
        },
    }).then((stream) => {
        let video = document.querySelector("video");
        video.height = window.innerHeight;
        video.width = window.innerWidth;
        video.srcObject = stream;
    });

    document.querySelectorAll(".music-play").forEach((value) => {
        value.addEventListener("click", () => {
            document.querySelector(`audio[src="${value.dataset.target}"]`).play();
        });
    });
});
