This is a [Slidedown][]-formatted presentation for the dev team at Viget. To run it, use the following commands:

    cat outline.md | ./add_delimiters.rb > slides.md
    slidedown slides.md | sed "5,8d" | sed "s/font-size: 1em/font-size: 0.6em/" | bcat

You'll need the [Slidedown][] and [bcat][] gems.

[bcat]: http://rtomayko.github.com/bcat/
[slidedown]: https://github.com/nakajima/slidedown

