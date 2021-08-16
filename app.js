const express = require('express');

const app = express();

const PORT = process.env.PORT || 8000;

app.use(express.json());

app.use('/', require('./router'));

app.listen(PORT, () => console.log(`Listening on port ${PORT}`))
