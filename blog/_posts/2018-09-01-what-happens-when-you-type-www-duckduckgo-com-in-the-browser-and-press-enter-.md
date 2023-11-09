---
layout: post
title: Person types duckduckgo.com in their browser, you won't believe what happens next
permalink: /blog/:year/:month/:day/:title/
date: 2018-09-01
cover: /assets/posts/browser.jpg
description: What happens when you type duckduckgo.com in the browser and press Enter? Click here to find out!
tags: computers internet http browser
---

**duckduckgo.com** is typed in the [URL](https://en.wikipedia.org/wiki/URL) (Uniform Resource Locator or web address) bar and the Enter key is pressed.

![HTTP flow](/assets/posts/http_flow.jpg)

The browser requests files via [HTTP](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol) (Hypertext Transfer Protocol) from the server, then the server accepts the request and always sends a response back to the browser via HTTP, at least will send an error message. Resources such as HTML documents are fetched and sent over. A [TCP](https://en.wikipedia.org/wiki/Transmission_Control_Protocol) (Transmission Control Protocol) connection must be established first. Usually a browser is the one that initiates a request.

# DNS Lookup

The browser sends a request to a [DNS](https://en.wikipedia.org/wiki/Domain_Name_System) (Domain Name System) to look up the domain *duckduckgo.com* and get back the [IP address](https://en.wikipedia.org/wiki/IP_address) (Internet Protocol address, a numerical label assigned to each device connected to a network) for that domain. In this case *176.34.155.23* is returned to the browser.

DNS is just a key/value lookup for domain names and their IP addresses, it’s like the contact list from your phone, which links names to phone numbers.

# TCP

A connection is established through TCP on *port 80*, at which point, a request can be sent to the server over HTTP.

A TCP connection must be established before a server-client exchange can happen. When a TCP connection is opened, a message is sent over HTTP, then the browser reads the response the server sends back, the connection can be closed or renewed for another request. The message sent over HTTP has different format: HTTP Request and HTTP Response.

**HTTP**: Hypertext Transfer Protocol. Hypertext: *Linked web documents*. Protocol: *set of rules for communication between two computers*.

HTTP is stateless as there is no direct connection between successive requests. That’s why cookies are used, they allow having a session for the requests, they allow having a session for the requests to share a context. For instance, that’s how the server knows each request is from the same client, there’s a session id linking all the requests.

# HTTP Request

This request will be a message indicating the wanted action for the resource that needs to be fetched.

The request will have a method (*GET, POST, DELETE*), which is what kind of action will be performed, the path (*/index*) of the resource; without protocol, domain, or TCP port. It also contains the protocol version (*HTTP/1.1*) and optional headers or body.

**Request methods** ([rfc7231](https://tools.ietf.org/html/rfc7231#section-4)) indicate the wanted action for a resource, they are also known as HTTP Verbs.

* **GET**: only retrieves data, it does not change data in the server.
* **HEAD**: like GET, but does not have a body.
* **OPTIONS**: gives information about the resource without retrieving it, for instance, what other methods are supported.
* **POST**: submit an entity to a resource, there is usually a payload in the request body, it creates or updates the resource.
* **PUT**: replaces the target entity with the payload, like POST but idempotent (always produces the same result).
* **PATCH**: allows partial modification of a resource.
* **DELETE**: deletes a resource.

There are other components in between the server and the browser, multiple layers that can perform different functions and are usually called proxies: authentication, caching, load balancing, etc. There could also be a CDN, which serves static assets faster by being distributed servers around the world. The assets will be served from a shorter distance rather than the original server.

# Web server

The message will be encoded and sent over to the DuckDuckGo web server, which looks up and prepares the resource needed for the response.

The web server stores software and files (HTML, CSS, Javascript, images, etc.). The software, HTTP server, controls how these files are accessed by users through requests. It understands URLs (addresses) and HTTP (protocol).

# Web application

At this point a web application could query a database or cache might help avoid that, and will generate data for the response, which is sent back.

A web application executes business logic and is usually built using a framework. The framework will generate code to make it easier deal with requests and responses, access data, abstract database access using ORM, which is just a mapper for the underlying database, it also can use templates to generate documents. It can also provide security against attacks: XSS (injects client side scripts to perform attacks), SQL injection (execution of unwanted SQL code), CSRF.

A server can serve static or dynamic content. Static is served “as-is” while dynamic, usually, the content is generated by a web application with the help of a database.

There will be some caching for common queries to avoid extra computation. There might be job queries, which run actions asynchronously.

# HTTP Response

The response is received by the browser. It starts rendering the page and might ask a [CDN](https://en.wikipedia.org/wiki/Content_delivery_network) (Content Delivery Network) for stylesheets, images, etc.

A response will have the protocol version, a status code (*200, 404, 500*) which shows if the request was successful, a status message, HTTP headers and an optional body containing the resource.

Status codes and messages ([rfc7231](https://tools.ietf.org/html/rfc7231#section-6))

* **1xx**: information.
* **2xx**: successful responses. *200 OK, 201 Created*
* **3xx**: redirection. *301 Moved permanently*
* **4xx**: client errors. *400 Bad request, 401 Unauthorized, 403 Forbidden, 404 Not found*
* **5xx**: server errors. *500 Internal Server Error, 502 Bad Gateway, 503 Service Unavailable*

# Rendering

The web browser is a user-agent, a tool performing actions for the end user. An HTML document is fetched and parsed, then all the additional assets, like scripts, stylesheets, and other content, images for instance.

Once the rendering is finished the website will be ready for the user.
