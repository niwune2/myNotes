const blessed = require('neo-blessed');

const screen = blessed.screen({
	smartCSR: true,
	title: 'Digital Clock'
});

const clock = blessed.box({
	top: 'center',
	left: 'center',
	width: '30%',
	height: 3,
	content: '',
	tags: true,
	style: {
		fg: 'yellow',
		bg: 'black',
		border: { fg: 'white' }
	},
	border: { type: 'line' }
});

function two(n){ return String(n).padStart(2,'0'); }

let is24h = true;

function renderTime() {
  const now = new Date();
  let h = now.getHours();
  let suffix = '';

  if (!is24h) {            // 12時間表示
    suffix = h >= 12 ? ' PM' : ' AM';
    h = h % 12 || 12;      // 0→12
  }

  const time = `${two(h)}:${two(now.getMinutes())}:${two(now.getSeconds())}${suffix}`;
  clock.setContent(time);  // ← blessedタグは一旦やめて素の文字だけ
  screen.render();
}

setInterval(renderTime, 1000);
renderTime();

screen.key(['t'], () => { is24h = !is24h; renderTime(); });
screen.key(['q', 'C-c'], () => process.exit(0));

setInterval(renderTime, 1000);
renderTime();

screen.append(clock);

setInterval(()=>{
	const now = new Date();
	const time = now.toLocaleTimeString();
	clock.setContent(`{bold}${time}{/bold}`);
	screen.render();
}, 1000);

screen.render();

