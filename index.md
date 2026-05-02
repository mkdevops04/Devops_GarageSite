---
layout: home
title: Access Auto Garage
---

# Welcome to Access Auto Garage

Access Auto Garage is a simple website created to demonstrate a DevOps pipeline.

## Our Services

- MOT Testing
- Oil Changes
- Brake Inspection
- Engine Diagnostics
- Full Vehicle Servicing

## About This Project

This site is intentionally simple. The purpose is to demonstrate how a DevOps pipeline can automatically build and deploy a website using GitHub Actions.

A small update was made here to trigger the CI/CD pipeline and observe both workflows — one using a Docker container and one using the default GitHub environment

## Latest Posts

{% for post in site.posts %}
- [{{ post.title }}]({{ post.url }}) — {{ post.date | date: "%-d %B %Y" }}
{% endfor %}