---
layout: page
title: Gallery
permalink: /gallery/
dirs:
  - traditional
  - digital
  - photography
---

I enjoy painting, drawing and taking pictures.

I prefer oils on canvas, but I do not have any techniques yet. My favourite painters are [Vermeer](http://www.essentialvermeer.com/vermeer_painting_part_one.html){:target="_blank"}, [Rembrandt](http://www.rembrandtpainting.net){:target="_blank"} and [Aivazovsky](http://www.1st-art-gallery.com/Ivan-Konstantinovich-Aivazovsky/Ivan-Konstantinovich-Aivazovsky-oil-paintings.html){:target="_blank"}.

I also like sketching and drawing on my graphics tablet in Krita (great software for this kind of activities).

Another activity I enjoy is Photography, still learning all the DSLR functionalities.

These are some of my favourite works, if you want to see more you can visit my Flickr portfolio at [flickr/mariusavram](https://www.flickr.com/photos/mariusavram){:target="_blank"}.

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
