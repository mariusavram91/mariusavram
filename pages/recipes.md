---
layout: default
title: Recipes
description: Some plant based recipes I make often
permalink: /recipes/
---

# Recipes

<ul class="post-list">
  {% for recipe in site.recipes %}
  <li>
    <strong>
      <a class="post-link" href="{{ recipe.url | prepend: site.baseurl }}"
        >{{ recipe.title }}</a>
    </strong>
    <p class="post-meta">{{ recipe.description }}</p>
  </li>
  {% endfor %}
</ul>