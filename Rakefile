require 'time'

desc 'Create a new draft post'
task :post do
    title = ENV['title']
    cover = ENV['cover']
    description = ENV['description']
    slug = "#{Date.today}-#{title.downcase.gsub(/[^\w]+/, '-')}"

    file = File.join(
        File.dirname(__FILE__),
        'blog/_posts',
        slug + '.md'
    )

    File.open(file, "w") do |f|
        f << <<-EOS.gsub(/^     /, '')
---
layout: post
title: #{title}
permalink: /blog/:year/:month/:day/:title/
date: #{Date.today}
cover: /assets/posts/#{cover}.jpg
description: #{description}
tags:
published: false
---

        EOS
    end

    system ("open #{file}")
end

desc 'Create a new draft recipe'
task :recipe do
    title = ENV['title']
    description = ENV['description']
    slug = "#{title.downcase.gsub(/[^\w]+/, '-')}"

    file = File.join(
        File.dirname(__FILE__),
        '_recipes',
        slug + '.md'
    )

    File.open(file, "w") do |f|
        f << <<-EOS.gsub(/^     /, '')
---
layout: recipe
title: #{title}
permalink: /recipes/:title/
description: #{description}
tags: 
---

#### Ingredients

        EOS
    end

    system ("open #{file}")
end
