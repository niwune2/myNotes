const blessed = require('neo-blessed');

const screen = blessed.screen({
	smartCSR: true,
	title: 'My first TUI'
});

const box = blessed.box({
	top: 'center',
	left: 'center',
	width: '50%',
	height: '50%',
	content: 'Hello, World',
	border: {
		type: 'line'
	},
	style: {
		fg: 'white',
		bg: 'blue',
		border: {
			fg: '#f0f0f0'
		}
	}
});

screen.append(box);

screen.key(['q', 'C-c'], ()=> process.exit(0));

screen.render();

