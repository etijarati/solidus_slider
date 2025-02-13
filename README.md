# SolidusSlider

Add a slider to the homepage of your Spree-Solidus site, and manage the slide show from within the Admin panel.

## Installation

To install, add solidus_slider to your @Gemfile@ and run `bundle install`:

```
gem 'solidus_slider', github: 'etijarati/solidus_slider'
```

Then install and run the migrations to add the tables:
```
bundle exec rails g solidus_slider:install

```

### Using the slider

Spree 3 uses the bootstrap framework and a default slider template is available for bootstrap 3
`spree/shared/_slider.html.erb`.

Example usage:

```erb
  <%= render partial: 'spree/shared/slider', locals: { slider: Spree::Slide.published, cid: 'home' } %>
```

If you desire to have a customized carousel template you can specify your own like so:

```erb
<% if Spree::Slide.published.count > 0 %>
  <section id="slideshow">
    <ul class="slide">
      <% Spree::Slide.published.order('position ASC').each do |s| %>
        <li>
          <h1><%= s.slide_caption %></h1>
          <%= link_to image_tag(s.slide_image.url), url_for(s.link_url) %>
        </li>
      <% end %>
    </ul>
    <a title="<%= t(:previous) %>" class="slider-prev"><%= t(:previous)%></a>
    <a title="<%= t(:next) %>" class="slider-next"><%= t(:next) %></a>
  </section>
<% end %>
```

## Dynamic content management

To add dynamic content, go to the spree admin section, under 'Configuration'
and find the Solidus Slider & Solidus Slider Locations menu.

You can create new slides and new locations. Then to fetch & render the slider for a particular location you can do the following:

```erb
  <% slides = Spree::Slide.published.location("home") %>
  <%= render partial: 'spree/shared/slider', locals: { slider: slides } %>
```

Copyright (c) 2012 [R.S.A.](http://www.rsaweb.com) released under the New BSD License
