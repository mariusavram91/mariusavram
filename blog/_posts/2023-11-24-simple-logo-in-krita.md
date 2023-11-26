---
layout: post
title: "How to create a simple vector logo in Krita"
permalink: /blog/:year/:month/:day/:title/
date:   2023-11-24 08:00:00
cover: /assets/posts/2023_11_krita_logo/krita.jpg
description: "How to easily create a simple vector graphics logo in Krita and export it as SVG"
tags: creative krita
---

If you need to create a quick and simple logo for your website, you can easily do this yourself without any previous knowledge of design or Photoshop.

As a long-time user of Linux as my chosen system for my laptop (I started with Debian and later moved to Ubuntu), I greatly appreciate an app working smoothly for me. One of my favourite apps ever is **Krita**. The design is slick minimalist, and it works great. I've used it for years for digital paintings, doodling, etc. [Krita](https://krita.org/){:target="_blank"}  is a **free (open-source) multiplatform tool** that you can use on your favourite operating system.

In this tutorial, I will use Krita to create a logo, but feel free to check out [Inkscape](https://inkscape.org/){:target="_blank"} , another free, open-source, multiplatform, and powerful tool. While Krita is more focused on Digital Painting, Inkscape is more targeted towards vector graphics editing, but Krita will do fine for a simple logo.

Install Krita following instructions [here](https://krita.org/en/download/krita-desktop/){:target="_blank"} . Once installed, open the app.

The first step is to create a new file. When you open Krita, you can see the _Start_ menu on the left panel. Either _Ctrl+N_ or click on _New Image_. Alternatively, you can go to the top menu and click _File > New..._

![New Krita File/Canvas](/assets/posts/2023_11_krita_logo/0_new_file.png){:loading="lazy"}

Then, we need to adjust the document **dimensions and resolution**. I made it **1000x1000 (300 PPI)**, but you can choose any width or height. Just make sure it's big enough to have ample space to work on details and ensure quality scaling of the graphic.

![Krita File Dimensions](/assets/posts/2023_11_krita_logo/1_create_canvas.png){:loading="lazy"}

**Pixel density**, or pixels per inch (PPI), refers to the number of pixels packed into one inch of a digital display. In resolution-independent vector graphics, pixel density becomes crucial when converting them to raster images, ensuring high quality and sharpness by specifying the appropriate PPI for printing or displaying on different devices.

Go to _Choose Workspace_ in the top right. Use the _Small Vector_ workspace, which gives you tool options in the right panel, next to the _Layers_ tab. We need to use **Fill and Stroke (or Outline)**.

![Vector Tool Options](/assets/posts/2023_11_krita_logo/2_tool_options.gif){:loading="lazy"}

Let's create a Vector Layer, which we will use to draw our logo. Either press  _Shift+Insert_ on your Keyboard or click on the _+ small down arrow > Add Vector Layer_ in the  _Layers_ box.

![Create a Vector Layer](/assets/posts/2023_11_krita_logo/3a_vector_layer.gif){:loading="lazy"}

To make it easier, we will show a Grid and choose Snap to Grid, which will align any line you are drawing to the grid and make it easier with precision. Feel free to Show Rulers as well.
- Show Grid: Either go to _View > Show Grid_ and check it or press _Ctrl+Shift+'_'
- Snap to Grid: Either go to _View > Snap To > Snap to Grid_ and check it or press _Ctrl+Shift+;_

![Show Grid and Snap to Grid](/assets/posts/2023_11_krita_logo/3b_show_grid_and_snap_to_grid.gif){:loading="lazy"}

Let's play around with different tools to get comfortable with them. You have to select the Vector layer, then choose any of the tools from the left: _Ellipse Tool, Polygon Tool, Free Hand Path Tool_. Then select the _Tool Options_ tab and change the _Geometry Options > Fill and Outline_. 

![Playground with Vector Tools](/assets/posts/2023_11_krita_logo/4a_stroke_and_fill.gif){:loading="lazy"}

The foreground colour is the one on top (Black), and the Background colour is the secondary one (White).

![Foreground vs Background Colours](/assets/posts/2023_11_krita_logo/4b_foreground_and_background_colour.png){:loading="lazy"}

Let's move on to creating the actual logo. I will draw a simple rocket and add some text. I use the Polygon tool, with _Fill > Background Colour_ (in my case, Cyan, and _no Outline_. (You can do the same with the Freehand Path Tool just to draw something.)

![Creating Rocket Launch Logo](/assets/posts/2023_11_krita_logo/5_create_logo.gif){:loading="lazy"}

Then, to save the logo as an **SVG (Scalable Vector Graphics)**, make sure to select the Vector layer, then go to the top menu, _Layer > Import/Export > Save Vector Layer as SVG_. Save your Krita file as well for future modifications.

![Saving Logo as SVG file](/assets/posts/2023_11_krita_logo/6_save_as_svg.gif){:loading="lazy"}

Now you have your SVG logo ready to use.

![Checking the SVG file](/assets/posts/2023_11_krita_logo/7_svg_logo.gif){:loading="lazy"}

Here's the SVG logo.

![Rocket Launch Logo](/assets/posts/2023_11_krita_logo/Rocket_Launch_Logo.svg){:loading="lazy"}