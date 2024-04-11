---
title: We Chall Challenges
path: '[[Arnav Kumar]](../../index.html) / '
---

This contains hints and main ideas of the [We Chall](https://www.wechall.net/challs) challenges.

# Score 1

::: wide
## CGX#3: Binary Encoding
<p class="right">06 Apr 2024</p>
:::

- Convert binary to decimal.

::: wide
## Training: Get Sourced
<p class="right">06 Apr 2024</p>
:::

- Inspect the HTML page source.

::: wide
## Training: ASCII
<p class="right">06 Apr 2024</p>
:::

- Convert decimal to ASCII.

::: wide
## Encodings: URL
<p class="right">06 Apr 2024</p>
:::

- Decode the [URL encoding](https://en.wikipedia.org/wiki/Percent-encoding).
- Because all characters in the string are in the reserved format, we can completely ignore all '%' signs and convert hexadecimal to ASCII.
  ```
  echo "%59%69…" | tr -d '%' | xxd -r -p
  ```

::: wide
## Training: Stegano I
<p class="right">06 Apr 2024</p>
:::

- Output the image as ASCII…

::: wide
## Training: Crypto - Caesar I
<p class="right">07 Apr 2024</p>
:::

- Decode the [Caesar cipher](https://en.wikipedia.org/wiki/Caesar_cipher).

::: wide
## Training: WWW-Robots
<p class="right">07 Apr 2024</p>
:::

- Visit the page restricted to webcrawlers by the [robots exclusion standard](https://en.wikipedia.org/wiki/Robots.txt).

::: wide
## 2021 Christmas Hippety
with help from my friend Ian Zhao
<p class="right">09 Apr 2024</p>
:::

- The `<a>` tag links to a website that then [301 redirects](https://en.wikipedia.org/wiki/HTTP_301) to `hop.php`.
- Try using `curl` to determine the content on that page.

# Score 2

::: wide
## 2021 Christmas Grampa
<p class="right">06 Apr 2024</p>
:::

- Compute the [SHA-1](https://en.wikipedia.org/wiki/SHA-1) hash in `solution.php`.

::: wide
## Prime Factory
<p class="right">08 Apr 2024</p>
:::

- Write a script to find these primes.

::: wide
## PHP 0817
<p class="right">09 Apr 2024</p>
:::

- Comparisons with different types in PHP does implicit type casting.

