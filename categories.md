---
layout: default
title: Categories
permalink: /categories/
---

{% include fetch_categories.html %}

{% comment %}
=======================
The purpose of this snippet is to list all the categories you have in your site.
=======================
{% endcomment %}
{% for category in categories %}
	<a href="#{{ category | slugify }}"> {{ category }} </a>
{% endfor %}


{% comment %}
=======================
The purpose of this snippet is to list all your posts posted with a certain category.
=======================
{% endcomment %}
{% for category in categories %}
	<h2 id="{{ category | slugify }}">{{ category }}</h2>
	<ul>
	 {% for post in site.posts %}
		 {% if post.categories contains category %}
		 <li>
		 <h3>
		 <a href="{{ post.url }}">
		 {{ post.title }}
		 <small>{{ post.date | date_to_string }}</small>
		 </a>
		 {% for category in post.categories %}
			 <a class="category" href="/blog/category/#{{ category | slugify }}">{{ category }}</a>
		 {% endfor %}
		 </h3>
		 </li>
		 {% endif %}
	 {% endfor %}
	</ul>
{% endfor %}


This is the base Jekyll theme. You can find out more info about customizing your Jekyll theme, as well as basic Jekyll usage documentation at [jekyllrb.com](https://jekyllrb.com/)

You can find the source code for Minima at GitHub:
[jekyll][jekyll-organization] /
[minima](https://github.com/jekyll/minima)

You can find the source code for Jekyll at GitHub:
[jekyll][jekyll-organization] /
[jekyll](https://github.com/jekyll/jekyll)


[jekyll-organization]: https://github.com/jekyll
