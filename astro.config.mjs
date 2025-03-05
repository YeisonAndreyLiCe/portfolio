// @ts-check
import { defineConfig } from "astro/config";
import mdx from "@astrojs/mdx";
import sitemap from "@astrojs/sitemap";
import rehypeExternalLinks from "rehype-external-links";

// https://astro.build/config
export default defineConfig({
  site: "https://yeisonandreylice.github.io",
  base: "/portfolio/",
  trailingSlash: "always",
  markdown: {
    rehypePlugins: [
      [
        rehypeExternalLinks,
        {
          content: { type: "text", value: " 🔗" },
          rel: ["noopener", "noreferrer"],
          target: "_blank",
          class: "external-link",
        },
      ],
    ],
    syntaxHighlight: "shiki",
    shikiConfig: {
      theme: "tokyo-night",
      wrap: true,
    },
  },
  integrations: [
    mdx({
      syntaxHighlight: "shiki",
      shikiConfig: {
        theme: "tokyo-night",
        wrap: true,
      },
    }),
    sitemap(),
  ],
});
