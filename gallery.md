---
layout: page
title: Gallery
show: true
permalink: /gallery/
dirs:
  - traditional
  - digital
  - photography
---

I enjoy painting, drawing, and taking pictures.

I prefer oils on canvas, but I do not have any techniques yet. My favourite painters are [Vermeer](http://www.essentialvermeer.com/vermeer_painting_part_one.html){:target="_blank"}, [Rembrandt](http://www.rembrandtpainting.net){:target="_blank"}, [Aivazovsky](http://www.1st-art-gallery.com/Ivan-Konstantinovich-Aivazovsky/Ivan-Konstantinovich-Aivazovsky-oil-paintings.html){:target="_blank"}, and [Jeremy Mann](http://redrabbit7.com){:target="_blank"}.

I also like sketching and drawing on my graphics tablet in [Krita](https://krita.org/en) (great software for this kind of activities and it's free).

These are some of my favourite, if you want to see more you can visit my Flickr portfolio at [flickr/mariusavram](https://www.flickr.com/photos/mariusavram){:target="_blank"}.


Do whatever you want with these pictures. _This gallery's content by <span xmlns:cc="http://creativecommons.org/ns#" property="cc:attributionName">Marius Avram</span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>._

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">
	<img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" />
</a>

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
