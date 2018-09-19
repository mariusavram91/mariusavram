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
