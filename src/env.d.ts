/// <reference path="../.astro/types.d.ts" />

interface Window {
  theme: {
    toggle: VoidFunction;
    getPreference: () => "light" | "dark";
  };
}
