// import { defineConfig } from 'vite';
// import react from '@vitejs/plugin-react';

// export default defineConfig({
//   plugins: [react()],
//   server: {
//     proxy: {
//       '/api': 'http://localhost:5000',
//     },
//   },
//   build: {
//     outDir: 'dist', // Output directory for the build
//     rollupOptions: {
//       input: {
//         main: './index.html', // Entry point for the build
//       },
//     },
//   },
// });


import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  server: {
    host: 'localhost', // Bind to IPv4 localhost
    port: 3000, // Frontend port
    proxy: {
      '/api': {
        target: 'http://[2401:4900:839b:9ab4:e3a3:cb77:72a:c94c]:5000', // Backend URL
        changeOrigin: true, // Required for proxying
        secure: false, // Disable SSL verification (if needed)
      },
    },
  },
  build: {
    outDir: 'dist', // Output directory for the build
    rollupOptions: {
      input: {
        main: './index.html', // Entry point for the build
      },
    },
  },
});