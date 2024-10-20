// @ts-check
import { defineConfig } from "astro/config";
import mdx from "@astrojs/mdx";
import sitemap from "@astrojs/sitemap";

// https://astro.build/config
export default defineConfig({
  site: "https://yeisonandreylice.github.io",
  base: "/portfolio/",
  trailingSlash: "always",
  markdown: {
    syntaxHighlight: "shiki",
    shikiConfig: {
      theme: "tokyo-night",
    },
  },
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
