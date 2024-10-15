/// <reference types="vitest" />
import { getViteConfig } from "astro/config";

export default getViteConfig(
  {
    test: {
      coverage: {
        reportsDirectory: "coverage",
        reportOnFailure: false,
        thresholds: {
          functions: 98,
          branches: 98,
        },
      },
    },
  },
  {
    site: "https://example.com/",
    trailingSlash: "always",
  },
);
