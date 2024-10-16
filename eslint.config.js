import globals from "globals";
import pluginJs from "@eslint/js";
import tseslint from "typescript-eslint";
import mdx from "eslint-plugin-mdx";
import prettierConfig from "eslint-config-prettier";
import astro from "eslint-plugin-astro";

export default [
  { files: ["**/*.{js,mjs,cjs,ts, astro, mdx, md}"] },
  {
    ignores: [".astro/*"],
  },
  {
    languageOptions: {
      globals: { ...globals.browser, theme: "readonly" },
    },
  },
  pluginJs.configs.recommended,
  ...tseslint.configs.recommended,
  prettierConfig,
  mdx.flat,
  ...astro.configs.recommended,
];
