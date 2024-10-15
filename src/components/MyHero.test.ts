import { experimental_AstroContainer as AstroContainer } from "astro/container";
import { expect, test } from "vitest";
import MyHero from "components/MyHero.astro";

test("My Hero", async (): Promise<void> => {
  const container = await AstroContainer.create();
  const result = await container.renderToString(MyHero);

  expect(result).toContain("Yeison Liscano");
  expect(result).toContain("Read Last Post");
});
