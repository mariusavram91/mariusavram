---
layout: page
title: Gallery
permalink: /gallery/
dirs:
  - traditional
  - digital
  - photography
---

{% for dir in page.dirs %}
<div class="gallery">
  <h2 class="type">{{ dir }}</h2>
  {% for image in site.static_files %}
    {% if image.path contains dir %}
    <img class="thumbnail" width="25%" src="{{ site.baseurl }}{{ image.path }}" />
    {% endif %}
  {% endfor %}
</div>
{% endfor %}
