diffrent
========

Diffrent is a very simple way to do ActiveRecord version diffing. It provides
a convenient interface to two other libraries 
([Diffy](https://github.com/samg/diffy) and [Vestal Versions](https://github.com/laserlemon/vestal_versions)), combining their functionality. 

It makes no assumption about what web framework you're using - it can be used in
Sinatra, Padrino, Rails, or with no framework at all. 

For details of using Diffy and Vestal Versions, please see the docs for those
gems.

Installation:
-------------

```
gem install diffrent
```

In a Gemfile:

```ruby 
gem 'vestal_versions', :git => "git://github.com/futurechimp/vestal_versions.git"
gem 'diffrent'
```
Vestal Versions is currently a bit out of date, I've put up an updated version
in this fork. 

Padrino gotcha: when using Vestal Versions with Padrino, you'll need to put the
`gem 'vestal_versions'` requirement *after* `gem 'padrino'` in your Gemfile.
Vestal Versions needs ActiveRecord loaded before it can show up in a Gemfile. 


Usage
-----

Let's say you've got a `Post` model, with a title and a body. You've already
set up Vestal Versions, and
your Post model looks like this:

```ruby
class Post
  versioned
end
```

With this all set up, you'll get a new version every time you save a Post object
instance. How to get the differences between arbitrary versions? This is where
diffrent comes in. 

After adding 'diffrent' to your Gemfile and running 'bundle install', you can 
change your Post model so it looks like this:

```ruby
class Post
   versioned
   include Diffrent
end
```

This give you the ability to pick up changes between different versions of your
Post objects. For example:

    > @post = Post.create(:title => "Arnold says", :body => "What you talking about, Willis?")
    > @post.body = "This is what Willis is talking about"
    > @post.save # creates a new version

Now we can:

    > @post.diff_for(:body, 1,2)

    => "<div class=\"diff\">
          <ul>
            <li class=\"del\"><del><strong>This is w</strong>hat <strong>Willis is</strong> talking about</del></li>
            <li class=\"ins\"><ins><strong>W</strong>hat <strong>you</strong> talking about<strong>, Willis?</strong></ins></li>
          </ul>
        </div>"

By default, you'll get back HTML in your diffs. There's a final options hash 
on the `diff_for` method call, so that you can pass a :format option to Diffy:

    > # get back raw text
    >   p.diff_for(:body, 1, 2, :format => :text)
    => "-This is what Willis is talking about
        +What you talking about, Willis?" 

    > # get back coloured text
    > p.diff_for(:body, 1, 2, :format => :color)
    => "\e[31m-This is what Willis is talking about\e[0m\n\\ No newline at end of file\n\e[32m+What you talking about, Willis?\e[0m\n\\ No newline at end of file\n" 

You can also pass a format of `nil` to get back a raw Diffy object if you need one.


Using it in a web app
---------------------

Here's one way to incorporate Diffrent into a webapp to provide a user interface
for viewing change. It's a Padrino example, but Sinatra or Rails will be 
substantially the same.

First, you'll need a controller action:

```ruby
get :view_differences, :map => "/posts/:id/view_differences/:old/:new" do
  @post = Post.find(params[:id])
  render 'posts/view_differences'
end
```

Your view code can then look like this (please excuse my awesome HTML):

```erb
<% new_version = params[:new].to_i %>
<% old_version = params[:old].to_i %>

<p>Title:
  <%= @post.diff_for(:title, old_version, new_version) %>
</p>
<p>Body:
  <%= @post.diff_for(:body, old_version, new_version) %>
</p>

<p>
  <% if @post.has_versions_before?(new_version) %>
      <%= link_to("<< earlier", 
          url(:posts, :view_differences, :id => @post.to_param, 
              :old => new_version - 2,
              :new => new_version - 1)) %>
  <% end %>

  <% if @post.has_versions_after?(new_version) %>
    <%= link_to("later >>", 
          url(:posts, :view_differences, :id => @post.to_param, 
              :old => new_version,
              :new => new_version + 1)) %>
  <% end %>
</p>
```

As you can see, it's a bit manual - it seemed best to make very few assumptions
about how people will want to use this. 

Because of the (wonderful and simple) way that Vestal Versions works, you can 
diff arbitrary versions using this controller action and view - for instance, 
hitting a route like `/posts/1/view_differences/3/50` would give you a diff
on the title and body for all revisions between r3 and r50. 


Contributing to diffrent
------------------------

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

== Copyright

Copyright (c) 2012 Dave Hrycyszyn. See LICENSE.txt for
further details.

