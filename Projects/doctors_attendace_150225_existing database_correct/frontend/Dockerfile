# Use Node.js official image
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy the rest of the app
COPY . .

# Build the React app (Vite generates files in the `dist` folder)
RUN npm run build

# Expose port 3000
EXPOSE 3000

# Serve the built files using a simple HTTP server
CMD ["npx", "serve", "-s", "dist", "-l", "3000"]