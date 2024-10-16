import { defineConfig } from "cypress";

export default defineConfig({
  e2e: {
    baseUrl: "http://localhost:4040",
    defaultCommandTimeout: 12000,
    retries: {
      openMode: 0,
      runMode: 2,
    },
    specPattern: "specs/*.cy.ts",
    testIsolation: true,
    video: false,
    viewportHeight: 1080,
    viewportWidth: 1920,
  },
});
