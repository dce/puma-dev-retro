This is a [Slidedown][]-formatted presentation for the dev team at Viget. To run it, use the following commands:

    cat outline.md | ./add_delimeters.rb > slides.md
    slidedown slides.md | sed -e "5,8d" | bcat

You'll need the [Slidedown][] and [bcat][] gems.

[bcat]: http://rtomayko.github.com/bcat/
[slidedown]: https://github.com/nakajima/slidedown
