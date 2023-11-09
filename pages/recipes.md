---
layout: default
title: Recipes
permalink: /recipes/
---

### Recipes

<ul class="post-list">
  {% for recipe in site.recipes %}
  <li>
    <h4>
      <a class="post-link" href="{{ recipe.url | prepend: site.baseurl }}"
        >{{ recipe.title }} - {{ recipe.description }}</a
      >
    </h4>
  </li>
  {% endfor %}
</ul>