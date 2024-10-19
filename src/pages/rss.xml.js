import rss, { pagesGlobToRssItems } from "@astrojs/rss";
import { getCollection } from "astro:content";
import sanitizeHtml from "sanitize-html";
import MarkdownIt from "markdown-it";

const parser = new MarkdownIt();

export async function GET(context) {
  const blog = await getCollection("posts");
  const pagesItems = await pagesGlobToRssItems(
    import.meta.glob("./posts/*.{md,mdx}"),
  );

  return rss({
    title: "Yeison Liscano Portfolio",
    description: "About Yeison Liscano and his work and life",
    site: context.site,
    items: blog
      .map((post) => ({
        description: post.data.description,
        content: sanitizeHtml(parser.render(post.body), {
          allowedTags: sanitizeHtml.defaults.allowedTags.concat(["img"]),
        }),
        title: post.data.title,
        pubDate: post.data.pubDate,
        link: `/blog/${post.slug}/`,
        ...post.data,
      }))
      .concat(pagesItems),
  });
}
