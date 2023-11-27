---
layout: default
title: Blog
description: I write about stuff like software development, product management, dog training, cooking, climbing, etc.
permalink: /blog/
---

# Blog

<ul class="post-list">
  {% for post in site.posts %}
  <li>
    <strong>
      <a class="post-link" href="{{ post.url | prepend: site.baseurl }}"
        >{{ post.title }}</a
      >
      <p class="post-meta">{{ post.description }}</p>
      <p class="post-meta">Posted on {{ post.date | date: "%b %-d, %Y" }}</p>
    </strong> 
</li>
  {% endfor %}
</ul>
