const button = document.getElementById("checkButton");
const result = document.getElementById("result");

button.addEventListener("click", () => {
    const now = new Date().toLocaleString("vi-VN");

    result.textContent = `Website hoạt động bình thường! Thời gian: ${now}`;
});