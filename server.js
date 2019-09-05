'use strict';

const express = require('express');
var packages = require('./package.json');
//var myArgs = process.argv.slice(2);
//console.log('myArgs: ', myArgs);

// Constants
const PORT = 4433;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Hello world\n'+packages.version+'-'+JENKINSBUILD);
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);