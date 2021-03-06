[![Build Status](https://travis-ci.org/masarakki/parent_resource.svg?branch=master)](https://travis-ci.org/masarakki/parent_resource)
[![Dependency Status](https://gemnasium.com/masarakki/parent_resource.svg)](https://gemnasium.com/masarakki/parent_resource)
[![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/masarakki/parent_resource/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/masarakki/parent_resource/?branch=master)
[![Coverage Status](https://coveralls.io/repos/masarakki/parent_resource/badge.png?branch=master)](https://coveralls.io/r/masarakki/parent_resource?branch=master)
# parent_resource
in the controller of recursive resource, auto load parent resource

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'parent_resource'
```

## Usage

### config/routes.rb

```ruby
 resources :members
 resources :projects do
   resources :members
 end
```

### app/controller/members_controller.rb

```ruby
 # auto load @project when like /projects/1/members
 # not load when /members
 class MembersController < ActionController::Base
   parent_resource :project
 end
```

### app/view/members/new.html.erb

```rubyb
 # you can support both /projects/1/members/new and /members/new with single file
 <% form_for([@project, @member]) do |f| %>
    ...
 <% end %>
```

## Contributing

1. Fork it ( https://github.com/masarakki/parent_resource/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
