import { defineConfig } from "cypress";

export default defineConfig({
  e2e: {
    baseUrl: "http://localhost:4321/portfolio/",
    defaultCommandTimeout: 12000,
    retries: {
      openMode: 0,
      runMode: 2,
    },
    specPattern: "e2e/specs/*.cy.ts",
    testIsolation: true,
    video: false,
    viewportHeight: 1080,
    viewportWidth: 1920,
    supportFile: false,
  },
  screenshotsFolder: "e2e/screenshots",
});
