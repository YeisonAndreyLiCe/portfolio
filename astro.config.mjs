// @ts-check
import { defineConfig } from "astro/config";
import mdx from "@astrojs/mdx";
import sitemap from "@astrojs/sitemap";

// https://astro.build/config
export default defineConfig({
  site: "https://yeisonandreylice.github.io",
  base: "/portfolio/",
  trailingSlash: "always",
  integrations: [
    mdx({
      syntaxHighlight: "shiki",
      shikiConfig: {
        theme: "tokyo-night",
      },
    }),
    sitemap(),
  ],
});
