/* eslint-disable */
import { z, defineCollection } from "astro:content";
import { bundledLanguages, type BuiltinLanguage } from "shiki";

const blogCollection = defineCollection({
  schema: z.object({
    isDraft: z.boolean().default(true),
    title: z.string(),
    snippet: z.object({
      code: z.string(),
      language: z.custom<BuiltinLanguage>(
        (value) => Object.keys(bundledLanguages).includes(value as string),
        {
          message: "Invalid language",
        },
      ),
    }),
    author: z.string().default("Yeison Liscano"),
    tags: z.array(z.string()),
    footnote: z.string().optional(),
    pubDate: z.date(),
    description: z.string(),
    readingTime: z.number(),
  }),
});

export const collections = {
  posts: blogCollection,
};
