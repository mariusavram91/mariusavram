---
layout: default
title: Blog
permalink: /blog/
---

### Blog

<ul class="post-list">
  {% for post in site.posts %}
  <li>
    <h2>
      <a class="post-link" href="{{ post.url | prepend: site.baseurl }}"
        >{{ post.title }}</a
      >
      <span class="post-meta">{{ post.date | date: "%b %-d, %Y" }}</span>
    </h2>
  </li>
  {% endfor %}
</ul>