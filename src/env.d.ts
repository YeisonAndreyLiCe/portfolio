import "../.astro/types";

interface Window {
  theme: {
    toggle: VoidFunction;
    getPreference: () => "light" | "dark";
  };
}
