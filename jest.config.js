module.exports = {
  coverageReporters: ["html", "text"],
  roots: ["app/javascript"],
  moduleFileExtensions: ["js", "jsx", "json", "ts", "tsx", "node", "vue"],
  transform: {
    "^.+\\.vue$": "vue-jest",
    ".+\\.(css|styl|less|sass|scss|svg|png|jpg|ttf|woff|woff2)$": "jest-transform-stub",
    "^.+\\.jsx?$": "babel-jest"
  },
  transformIgnorePatterns: ["/node_modules/"],
  moduleNameMapper: {
    "^@/(.*)$": "<rootDir>/app/javascript/src/$1"
  },
  snapshotSerializers: ["jest-serializer-vue"],
  setupFiles: ["<rootDir>/app/javascript/tests/jest-init"]
  // collectCoverage: true,
  // collectCoverageFrom: ['app/javascript/src/**/*.{js,vue}', '!src/main.js']
};