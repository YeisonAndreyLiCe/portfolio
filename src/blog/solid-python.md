---
title: SOLID Python
pubDate: 2024-11-04
description: "SOLID Python"
tags: ["programming"]
isDraft: true
snippet:
  language: "python"
  code: "from abc import ABC, abstractmethod\n\nclass Animal(ABC):\n    @abstractmethod\n    def make_sound(self) -> str:\n        pass"
---

## SRP: Single Responsibility Principle

> A class should have only one reason to change.

In other words, a class should have only one responsibility or job. This
principle helps to keep classes small, focused, and maintainable.
