const express = require('express');
const fs = require('fs');
const path = require('path');
const app = express();
const port = 3000;

// Path to configuration file
const configFilePath = path.join(__dirname, 'config.json');

// Read service names from configuration file
const config = fs.existsSync(configFilePath) ? JSON.parse(fs.readFileSync(configFilePath)) : [];

// Base directory where route modules are located
const routesDir = path.join(__dirname, 'services');

// Function to load route modules dynamically
const loadRoutes = (routeNames) => {
  routeNames.forEach((routeName) => {
    const routePath = path.join(routesDir, routeName, 'routes', `${routeName}Routes.js`);
    if (fs.existsSync(routePath)) {
      const routeModule = require(routePath);
      app.use(`/${routeName}`, routeModule);
      console.log(`Loaded route: /${routeName}`);
    } else {
      console.warn(`Route file not found: ${routePath}`);
    }
  });
};

// Load routes based on provided configuration
loadRoutes(config.services);

// Start the server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
  console.log(`Enabled routes: ${config.services.length > 0 ? config.services.join(', ') : 'None'}`);
});
