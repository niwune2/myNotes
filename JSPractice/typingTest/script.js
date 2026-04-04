const container = document.getElementById('container');
const target = document.getElementById('target');
const result = document.getElementById('result');
const char = "D";
target.textContent = char;

// document.addEventListener('keydown', (e) => {
//   console.log(`key pressed, ${e.key}`);
//   let char = document.createElement('p');
//   char.textContent = `key pressed ${e.key}`;
//   container.appendChild(char);
// });

document.addEventListener('keydown', (e) => {
  console.log(`key pressed:${e.key}`);
  
  if(e.key === target.textContent) {
    result.textContent = "一致しました"
  } else {
    result.textContent = "不一致です"
  }
});