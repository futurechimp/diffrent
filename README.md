= diffrent

Diffrent is a very simple way to do ActiveRecord version diffing. It provides
a convenient interface to two other libraries (Diffy and Vestal Versions), 
combining their functionality. 

It makes no assumption about what web framework you're using - it can be used in
Sinatra, Padrino, Rails, or with no framework at all. 

== Installation:

 gem install diffrent

In a Gemfile:

 gem 'diffrent'

== Usage

Let's say you've got a `Post` model, with a title and a body. You've already
set up "Vestal Versions"[https://github.com/laserlemon/vestal_versions], and
your Post model looks like this:

 class Post
   versioned
 end

With this all set up, you'll get a new version every time you save a Post object
instance. How to get the differences between arbitrary versions? This is where
diffrent comes in. 

After adding 'diffrent' to your Gemfile and running 'bundle install', you can 
change your Post model so it looks like this:

 class Post
   versioned
   include Diffrent
 end

Now you've got the ability to pick up changes between different versions of your
Post objects. For example:

 > @post = Post.create(:title => "Arnold says", :body => "What you talking about, Willis?")
 > @post.body = "This is what Willis is talking about"
 > @post.save # creates a new version

Now we can:

 > @post.diff_for(:body, 1,2)

 => "<div class=\"diff\">\n  <ul>\n    <li class=\"del\"><del><strong>This is w</strong>hat <strong>Willis is</strong> talking about</del></li>\n    <li class=\"ins\"><ins><strong>W</strong>hat <strong>you</strong> talking about<strong>, Willis?</strong></ins></li>\n  </ul>\n</div>\n" 

There's a final options hash on the method call, so that you can pass a format
to Diffy:

 > # get back raw text
 >   p.diff_for(:body, 1, 2, :format => :text)
 => "-This is what Willis is talking about\n\\ No newline at end of file\n+What you talking about, Willis?\n\\ No newline at end of file\n" 

 > # get back coloured text
 > p.diff_for(:body, 1, 2, :format => :color)
 => "\e[31m-This is what Willis is talking about\e[0m\n\\ No newline at end of file\n\e[32m+What you talking about, Willis?\e[0m\n\\ No newline at end of file\n" 

You can also pass a format of `nil` to get back a raw Diffy object if you need one.





== Contributing to diffrent
 
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
