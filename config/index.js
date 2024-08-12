module.exports = {
  mode: process.env.DEPLOYMENT_MODE || 'all',
  services: {
    pr1: {
      host: 'localhost',
      port: 3000,
    },
    pr2: {
      host: 'localhost',
      port: 3001,
    },
    pr3: {
      host: 'localhost',
      port: 3002,
    },
    pr4: {
      host: 'localhost',
      port: 3003,
    },
  },
};