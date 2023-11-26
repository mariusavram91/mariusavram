---
layout: post
title: Migrating my website to Jekyll and Github Pages
permalink: /blog/:year/:month/:day/:title/
date: 2016-09-04
cover: /assets/posts/jekyll_github.jpg
description: How I migrated my website to Jekyll and Github Pages.
tags: development update ruby jekyll github
footnote: Thanks to Jekyll for the original logos, jekyllrb.com.
---

Last year I thought I should have my own website, like many other developers, so I built it. I was starting with Python at the time and I didn’t like Wordpress, I still don’t, so I decided to use a Python CMS instead. I found a few options and decided to go with [Django Mezzanine](http://mezzanine.jupo.org){:target="_blank"} hosting it on my own server.

When I decided to change the website I did look for other Static Site Generators, especially written in Python, like [Pelican](http://getpelican.com){:target="_blank"}. But ultimately, I decided to go with [Jekyll](https://jekyllrb.com){:target="_blank"}, I have used it a few times before and it’s easily deployable to [Github Pages](https://pages.github.com){:target="_blank"}.

I know there are many other posts on how to migrate from [insert CMS here] to Jekyll and Github Pages, but I wanted to write about my own experience.

## Jekyll

> Jekyll is a simple, blog-aware, static site generator. It takes a template directory containing raw text files in various formats, runs it through a converter (like Markdown) and our Liquid renderer, and spits out a complete, ready-to-publish static website suitable for serving with your favourite web server. Jekyll also happens to be the engine behind GitHub Pages, which means you can use Jekyll to host your project’s page, blog, or website from GitHub’s servers for free. [What is Jekyll?](https://jekyllrb.com/docs/home){:target="_blank"}

It is really easy to install and use. I assume you already have Ruby installed.

```bash
~ $ gem install jekyll bundler
~ $ jekyll new website
~ $ cd website
~/website $ bundle install
~/website $ bundle exec jekyll serve
```

Then go to [http://localhost:4000](http://localhost:4000).

While developing I use: ```$ jekyll serve --host 0.0.0.0 --force_polling```.

## Github Pages

Github Pages is an easy and free way to host your projects. Forget about hosting your own server. The speed serving your site is also really good.

I had a couple of DDOS attacks directed to my server and many others issue hosting it on my own.

## Improvements

I changed a bit the design, improving the readability and making it nicer to see.

I have created a logo myself and added a banner with an image of my physical bookshelf, which gave me an idea for a future side project.

I changed some colours and fonts, and added a Projects page.

I can write my future posts in Vim and it’s easily deployed by just committing and pushing to Github. I now have absolutely everything under version control, my gallery files were not under version control before.

## Process

I exported everything I had from my old server and CMS. I changed everything to Markdown and changed the settings in _config.yml. Then I made a few changes to the style and the templates.

### Rakefile

I wrote a Rakefile with a task to create a draft post easily.

```ruby
require 'time'

desc 'Create a new draft post'
task :post do
    title = ENV['title']	
    cover = ENV['cover']
    description = ENV['description']
    slug = "#{Date.today}-#{title.downcase.gsub(/[^\w]+/, '-')}"

    file = File.join(
        File.dirname(__FILE__),
        '_posts',
        slug + '.markdown'
    )

    File.open(file, "w") do |f|
        f << <<-EOS.gsub(/^     /, '')
---
layout: post
title: "#{title}"
date: #{Date.today}
cover: /assets/posts/#{cover}.jpg
description: "#{description}"
categories:
published: false
---

        EOS
    end

    system ("vim #{file}")
end
```
Now, I can type

```
$ rake post title="Post title" cover="image_name" description="Summary of my new post."
```

and a file is automatically generated and opened in Vim for me to edit as a draft, ```published: false```.

### Domain

I created a file called CNAME in the repository's root path containing my domain, Github Pages will detect this as a custom domain.

I would like to serve my site over HTTPS, unfortunately, it is not straight forward and [a Cloudflare account is needed](https://sheharyar.me/blog/free-ssl-for-github-pages-with-custom-domains){:target="_blank"}.

I edited the zone file for the domain in my Gandi account adding the following entries:

```
@ 	A 	192.30.252.153
@ 	A 	192.30.252.154
www 	CNAME 	mariusavram91.github.io.
```

### Disqus

I integrated [Disqus](https://disqus.com/admin/universalcode){:target="_blank"} for post comments, adding disqus_name to my _config.yml and creating a disqus.html file in the _includes directory.

{% raw %}
```html
<div id="disqus_thread"></div>
<script>
    var disqus_config = function () {
        this.page.url = '{{ site.url }}{{ page.url }}';
        this.page.identifier = '{{ page.id }}';
    };
    (function() {  // DON'T EDIT BELOW THIS LINE
        var d = document, s = d.createElement('script');
        
        s.src = '//{{ site.disqus_name }}.disqus.com/embed.js';
        
        s.setAttribute('data-timestamp', +new Date());
        (d.head || d.body).appendChild(s);
    })();
</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript" rel="nofollow">comments powered by Disqus.</a></noscript>
```
{% endraw %}

### Google Analytics

I added the Google Analytics script to my footer.html file.

```html
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new
        Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'CHANGE-THIS', 'auto');
  ga('send', 'pageview');
</script>
```

### To do

Improve the gallery, which, at the moment, is just a list with the images. It takes a lot to load, even though I lowered the quality of the photos. I would also like to have a preview when clicking on each image.

I will add a custom 404 page, improve the tags and add HTTPS support.

## Conclusion

In a week, my site using Jekyll and Github Pages was available and I am quite happy with the change so far. The hardest part was to export/import some of the content and had to do it manually sometimes.

You can see the source code in [my Github repository](https://github.com/mariusavram91/mariusavram){:target="_blank"}.
