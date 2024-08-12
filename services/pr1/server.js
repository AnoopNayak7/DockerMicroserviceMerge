const express = require('express');
const app = express();
const { port } = require('./config/config');

const pr1Routes = require('./routes/pr1Routes');

app.use('/pr1', pr1Routes);

// Start the server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
