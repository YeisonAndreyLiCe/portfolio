---
title: Dynamic Programming
pubDate: 2025-02-19
description:
  "In this post, we will explore the dynamic programming technique. From
  overlapping sub-problems, optimal substructure, and memoization to bottom-up and
  top-down approaches. Let's dive in!"
tags: ["programming", "dynamic programming"]
layout: "../../layouts/Post.astro"
isDraft: true
snippet:
  language: "python"
  code: "SOLID Python"
---

Dynamic programming is a powerful technique used to solve complex problems by
breaking them down into simpler sub-problems. It is based on the idea of
**optimal substructure** and **overlapping sub-problems**. By solving each
subproblem only once and storing the results, dynamic programming can greatly
reduce the time complexity of a problem.

## Example

Let's consider the Fibonacci sequence as an example to illustrate dynamic
programming. The Fibonacci sequence is a series of numbers in which each number
is the sum of the two preceding ones, starting from 0 and 1. The sequence
begins as follows: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...

To calculate the nth Fibonacci number using dynamic programming, we can use
**memoization** to store the results of sub-problems and avoid redundant
calculations. Here's an example implementation in Python:

```python
def fibonacci(n, memo={}):
    if n in memo:
        return memo[n]
    if n <= 1:
        return n
    memo[n] = fibonacci(n - 1, memo) + fibonacci(n - 2, memo)
    return memo[n]

print(fibonacci(10))  # Output: 55
```
