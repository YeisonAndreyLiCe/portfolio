import { experimental_AstroContainer as AstroContainer } from "astro/container";
import { expect, test } from "vitest";
import MyHero from "components/MyHero.astro";

test("My Hero", async (): Promise<void> => {
  const container = await AstroContainer.create();
  // eslint-disable-next-line @typescript-eslint/no-unsafe-argument
  const result = await container.renderToString(MyHero);

  expect(result).toContain("Yeison Liscano");
  expect(result).toContain("Read Last Post");
});
