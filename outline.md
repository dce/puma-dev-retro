PUMA Dev Retrospective
======================

[github.com/dce/puma-dev-retro][github]

[github]: https://github.com/dce/puma-dev-retro

## PUMA Dev Retro

  1. Architecture
  2. Tips &amp; Techniques
  3. Larger Issues/Lessons

## 1. Architecture

### [Typus][]

[typus]: https://github.com/typus/typus

### Relationship system

    class Event < ActiveRecord::Base
      relate_to :media_item, :product
    end

    # @event.related_media_items

### Modules

    class Event < ActiveRecord::Base
      include Locatable
      include Address
      include GenerateSlug
      include TrackUpdates
      include Commentable
      include Publishable
      include Featurable
      include Excludable
      include Taggable

      extend Related
      extend RelatedToStore
      extend Sanitizer
      extend Geotaggable
    end

### Middlewares

  * Redirector
  * Mobilizer
  * Translator

### Integration/Stack Testing

### Akamai

  * Geolocation
  * Cache busting

## 2. Tips

### [Redis][]

  * Fragment cache
  * [CacheBar][]

[redis]: http://redis.io/
[cachebar]: https://github.com/vigetlabs/cachebar

### [RLIKE][] 

[rlike]: http://dev.mysql.com/doc/refman/5.0/en/regexp.html

### [git cherry][cherry]

    + 497034f2 Listener.new now accepts a hash of options
    - 2d0333ff cache the absolute images path for growl messages
    + e4406858 rename Listener#run to #start

[cherry]: http://www.kernel.org/pub/software/scm/git/docs/git-cherry.html

### Learning from Mistakes

### Test Macros

    class Admin::AmbassadorsControllerTest < ActionController::TestCase
      should_render_default_views
    end

### Test Macros (Con't)

    if actions.include?("update")
      context "on GET to #edit" do
        setup do
          get :edit, :id => @resource.id
        end

        should_respond_with :success
      end
    end

### [Preflight Tasks][preflight]

    task :img do
      if_files_include? "<img src=\"/images", :in => :app do |paths|
        puts "\ERROR: Found <img> tags referencing '/images' in these files:\n\n"
        paths.each {|path| puts " - #{path}" }
        puts "\nThese should be replaced with 'image_tag' to ensure they still work in production w/ asset hosts.\n"
        exit 1
      end
    end

[preflight]: http://www.viget.com/extend/testing-your-codes-text/

### [.presence][presence]

    title.present? ? title : label

    # versus

    title.presence || label

[presence]: http://rubyquicktips.com/post/9247085311/directly-access-an-object-if-its-present

### Branches

  * master/staging/production/etc.
  * `git log --oneline --decorate`

### Gems

  * [Sunspot](http://outoftime.github.com/sunspot)
  * [SearchLogic](http://github.com/binarylogic/searchlogic)
  * [AuthLogic](http://github.com/binarylogic/authlogic)
  * [Paperclip](https://github.com/thoughtbot/paperclip)
  * [Geokit](http://github.com/andre/geokit-gem)
  * [redis-namespace](https://github.com/defunkt/redis-namespace)

### Gems (Testing)

  * [Shoulda](https://github.com/thoughtbot/shoulda)
  * [Mocha](http://mocha.rubyforge.org/)
  * [FactoryGirl](https://github.com/thoughtbot/factory_girl)
  * [FakeWeb](http://github.com/chrisk/fakeweb)
  * [Rack::Test](http://github.com/brynary/rack-test)

### Gems (Obscure)

  * [Carmen](https://github.com/jim/carmen)
  * [Money](https://github.com/RubyMoney/money)
  * [Phone](http://github.com/carr/phone)
  * [RoutingFilter](http://github.com/svenfuchs/routing-filter)
  * [FrontCompiler](https://github.com/MadRabbit/frontcompiler)

## 3. Larger Issues/Lessons

### PM Turnover

### 40 vs. 32 Hr. Week

### Cross-Office Communication

### Release Planning

### Sysadmin/Deploy Situation

### Ramping Up New Devs

### Bad Code

### Long Engagement

### Conclusion

## Thanks!

  * <https://github.com/dce/puma-dev-retro>
  * <https://github.com/nakajima/slidedown>
