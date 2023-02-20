# Micro Frontends Hub

This repository contains an example of a Micro Frontends (MFE) application using the module federation plugin of Webpack 5.

The main goal of this repository is to provide a reference for developers interested in MFE architecture and module federation.

## Content

The repository contains a main application (`mfe-hub`), which serves as the entry point for the micro frontend architecture, and two micro frontend applications (`mfe1` and `mfe2`), which are loaded dynamically into the main application at runtime.

Each micro frontend application was built using a different framework: `mfe1` was built using React and `mfe2` was built using Vue.js.

## Technologies Used

- JavaScript
- Webpack 5
- Module Federation Plugin
- React
- Vue.js

## How to Run

To run the example, first clone the repository and navigate to the `mfe-hub` folder. Then, run the following commands:

1. `npm install` or `yarn install`
2. `npm start` or `yarn start`

This will start the development server and the micro frontend applications will be loaded into the main application at runtime.

## License

This project is licensed under the MIT License.
