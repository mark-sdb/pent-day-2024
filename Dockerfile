FROM ghcr.io/cirruslabs/flutter:3.19.6 AS build

WORKDIR /app

# Copy pubspec and lock files (and local path dependency)
COPY ./pubspec.* ./
COPY ./widgetbook/pubspec.* ./widgetbook/

RUN flutter pub get
RUN cd widgetbook && flutter pub get

# Copy app dir over to the container
COPY ./ ./

# Fetch all dependencies
RUN flutter pub get --offline
RUN cd widgetbook && flutter pub get --offline

RUN cd widgetbook && dart run build_runner build -d

# Build the app for the web
RUN cd widgetbook && flutter build web --release

# Use a smaller image, for serving the web app
FROM nginx:alpine

# Copy the built web app to the nginx server
COPY --from=build ./app/widgetbook/build/web /usr/share/nginx/html

# Expose the port
EXPOSE 80

# Start the server
CMD ["nginx", "-g", "daemon off;"]