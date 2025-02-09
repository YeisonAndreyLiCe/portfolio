---
title: Time Value of Money
pubDate: 2024-02-01
description: "The time value of money is a fundamental concept in finance.
It states that a dollar today is worth more than a dollar in the future."
tags: ["finance"]
isDraft: true
layout: "../../layouts/Post.astro"
snippet:
  language: "bash"
  code: "
"
---

## The magic of compound interest

Money makes money, the interest earns interest. When you invest money,
you earn interest on the principal amount. Over time, the interest you
earn also earns interest. This is a exponential process that can lead to
significant growth in your investment.

$$
FV = PV \times (1 + r)^n
$$

Where:

- \(FV\) is the future value of the investment
- \(PV\) is the present value of the investment
- \(r\) is the interest rate
- \(n\) is the number of periods

This can work backwards as well. If you know the future value of an investment,
you can calculate the present value.

$$
PV = \frac{FV}{(1 + r)^n}
$$

## Three types of amounts

- Lump sum: A single amount of money
- Annuity: A series of equal payments

$$
FV = PMT \times \frac{(1 + r)^n - 1}{r}
$$

Where:

- \(FV\) is the future value of the annuity
- \(PMT\) is the payment amount
- \(r\) is the interest rate
- \(n\) is the number of periods

$$
PV = PMT \times \frac{1 - (1 + r)^{-n}}{r}
$$

Where:

- \(PV\) is the present value of the annuity
- \(PMT\) is the payment amount
- \(r\) is the interest rate
- \(n\) is the number of periods

- Series of cash flows: A series of unequal payments
