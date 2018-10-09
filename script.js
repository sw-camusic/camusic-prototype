window.addEventListener("DOMContentLoaded", () => {
    navigator.mediaDevices.getUserMedia({
        audio: false,
        video: {
            facingMode: "environment",
        },
    }).then((stream) => {
        let video = document.querySelector("video");
        video.autoplay = true;
        video.height = window.innerHeight;
        video.srcObject = stream;
        video.width = window.innerWidth;
    });

    document.querySelectorAll(".music-play").forEach((value) => {
        value.addEventListener("click", () => {
            document.querySelector(`audio[src="${value.dataset.target}"]`).play();
        });
    });
});
