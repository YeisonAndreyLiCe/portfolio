// eslint-disable-next-line @typescript-eslint/triple-slash-reference
/// <reference path="../.astro/types.d.ts" />
import "../.astro/types";

declare global {
  interface Window {
    theme: {
      toggle: VoidFunction;
      getPreference: () => "light" | "dark";
    };
  }
}
