---
layout: default
title: Recipes
permalink: /recipes/
---

### Recipes

<ul class="post-list">
  {% for recipe in site.recipes %}
  <li>
    <h2>
      <a class="post-link" href="{{ recipe.url | prepend: site.baseurl }}"
        >{{ recipe.title }} - {{ recipe.description }}</a
      >
    </h2>
  </li>
  {% endfor %}
</ul>