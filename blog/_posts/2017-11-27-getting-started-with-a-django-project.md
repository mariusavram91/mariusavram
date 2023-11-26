---
layout: post
title: Getting started with a Django project
permalink: /blog/:year/:month/:day/:title/
date: 2017-11-27
cover: /assets/posts/django_project.jpg
description: How I start my Django projects, from installation to first page.
tags: python development django
---

Django is a versatile, extremely fast, very secure, and easily scalable Python Web framework, with many extra feature right out of the box, like: user authentication, content administration, etc.

## Requirements


```bash
$ sudo apt-get install git
$ sudo apt-get install python3
$ sudo apt-get install python3-pip
$ sudo pip install virtualenv
```

## Environment

```bash
$ mkdir project
$ cd project
$ virtualenv --python=/usr/bin/python3 env
```


You can activate it.

```bash
$ source ./env/bin/activate
```

Verify the version of python from the first line by the below command.

```bash
$ python
Python 3.5.2 (default, Nov 23 2017, 16:37:01)
[GCC 5.4.0 20160609] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

When not using you can deactivate it.
```bash
$ deactivate
```

## Django project

```bash
$ pip install django
$ python -m django --version
```

![Django Installation](/assets/posts/django_2017/0_django_installed.jpg){:loading="lazy"}

```bash
$ pip freeze > requirements.txt
```

```bash
$ pip install -r requirements.txt
```

```bash
$ django-admin startproject website
$ cd website
$ python manage.py migrate
$ python manage.py runserver
```

![Django Project initial structure](/assets/posts/django_2017/1_initial_structure.jpg){:loading="lazy"}

```bash
$ python manage.py runserver 0:8000
```

Then go to [http://localhost:8000](http://localhost:8000){:target="_blank"}.

![Django Running migrations](/assets/posts/django_2017/2_running_migrations.jpg){:loading="lazy"}

### Git

Let's use git to save the current changes.

```bash
$ vim .gitignore
```

```
*.pyc
*.swp
env
db.sqlite3
```

```bash
$ git init
$ git add .
$ git commit -am "Initial commit"
```

## Django Blog app

Now let's add a blog.

```bash
$ python manage.py startapp blog
```

```bash
$ python manage.py makemigrations blog
$ python manage.py migrate
```

```bash
$ python manage.py shell
```

```bash
$ python manage.py createsuperuser
```

### Project URLS

```bash
$ vim website/urls.py
```

```python
from django.conf.urls import include, url
from django.contrib import admin
from django.urls import path

urlpatterns = [
    path('admin/', admin.site.urls),
    url(r'^', include('blog.urls')),
]
```

### Project settings

```bash
$ vim website/settings.py
```

```python
# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog',
]
```

### App URLS

```bash
$ vim blog/urls.py
```

```python
from django.conf.urls import url
from blog import views


urlpatterns = [
    url(r'^blog/(?P<pk>[0-9]+)/$', views.ShowView.as_view(), name='post-show'),
    url(r'^$', views.IndexView.as_view(), name='blog'),
]
```

### App views

```bash
$ vim blog/views.py
```

```python
from django.views import generic
from django.shortcuts import get_object_or_404
from blog.models import Post


class IndexView(generic.ListView):
    model = Post
    template_name = "index.html"
    context_object_name = "posts"
    queryset = Post.objects.all()


class ShowView(generic.DetailView):
    model = Post
    template_name = "show.html"
    context_object_name = "post"

    def get_object(self, queryset=None):
        pk = self.kwargs.get(self.pk_url_kwarg, None)
        return get_object_or_404(Post, pk=pk)
```

### App models

```bash
$ vim blog/models.py
```

```python
from django.db import models
from django.urls import reverse


class Post(models.Model):
    title = models.CharField(max_length=150)
    author = models.CharField(max_length=150)
    content = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True, editable=False)
    modified_at = models.DateTimeField(auto_now=True, editable=False)

    def get_absolute_url(self):
        return reverse('post-show', args=[str(self.id)])
```

### App templates

```bash
$ mkdir blog/templates
$ vim blog/templates/base.html
```

```html
{% raw %}<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <title>Blog</title>
    </head>
    <body>
        {% block content %}{% endblock %}
    </body>
</html>{% endraw %}
```

```bash
$ vim blog/templates/index.html
```

```html
{% raw %}{% extends 'base.html' %}
{% block content %}
  <h1>Blog posts</h1>
  {% for post in posts %}
    <div><a href="{{ post.get_absolute_url }}">{{ post.title }}</a> by {{ post.author }}</div>
  {% endfor %}
{% endblock %}{% endraw %}
```

```bash
$ vim blog/templates/show.html
```

```html
{% raw %}{% extends 'base.html' %}
{% block content %}
        <h1>{{ post.title }}</h1>
        <h2>by {{ post.author }}</h2>
        <div>{{ post.content }}</div>
        <a href="/">Back</a>
{% endblock %}{% endraw %}
```

### Final steps

```bash
$ python manage.py migrate
$ python manage.py runserver
```
![Django New model migration](/assets/posts/django_2017/4_new_model_migration.jpg){:loading="lazy"}

Then go to [http://localhost:8000](http://localhost:8000){:target="_blank"}.

```bash
$ vim blog/admin.py
```

```python
from django.contrib import admin
from .models import Post


@admin.register(Post)
class BlogAdmin(admin.ModelAdmin):
    pass
```

![Django Admin with new Post model](/assets/posts/django_2017/5_django_admin_with_new_model.jpg){:loading="lazy"}

```bash
$ git commit -am "Add blog"
```

And that's all! Check out the Django documentation for more.
