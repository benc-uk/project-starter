//
// ======== Browser-sync config file ========
//

module.exports = {
  port: 3000,
  watch: true,
  server: {
    baseDir: './src',

    // Use one or the other
    directory: true,
    //index: 'index.html',
  },

  // SPA like mode, enable to serve an index.html file for all non-asset routes
  single: false,

  // You can switch this on, but doesn't seem very helpful
  ui: false,

  // Optional, open an external tunnel
  tunnel: false, //'benc-dev-tunnel',

  // Annoying in browser notifications on reloading etc
  notify: false,

  // Use HTTPS with a self-signed certificate
  https: false,
}
