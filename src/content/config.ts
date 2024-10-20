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
    readingTime: z.string().default("1 min read"),
  }),
});

type IPostFrontmatter = {
  isDraft: boolean;
  title: string;
  snippet: {
    code: string;
    language: BuiltinLanguage;
  };
  author: string;
  tags: string[];
  footnote?: string;
  pubDate: Date;
  description: string;
  readingTime: string;
};

export type { IPostFrontmatter };

export const collections = {
  posts: blogCollection,
};
