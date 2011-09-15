PUMA Dev Retrospective
======================

[github.com/dce/puma-dev-retro][github]

[github]: https://github.com/dce/puma-dev-retro

## PUMA Dev Retro

  1. Architecture
  2. Tips &amp; Techniques
  3. Larger Lessons &amp; Issues

## 1. Architecture

### [Typus][]

  * [Generators vs. Frameworks][hn]

[typus]: https://github.com/typus/typus
[hn]: http://news.ycombinator.com/item?id=2996781

### Relationship system

    class Event < ActiveRecord::Base
      relate_to :media_item, :product
      # ...
    end

    @event.related_media_items

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

      # ...
    end

### Branches

  * master/staging/production
  * feature branches
  * puma-dot-com

### Deployment

  * Integration (x2, one continuous)
  * Staging (PUMA)
  * Production (PUMA)

### Middlewares

  * Redirector
  * Mobilizer
  * Translator

### Integration/Stack Testing

    class RedirectorIntegrationTest < ActiveSupport::StackTestCase
      context "The Redirector middleware" do
        context "with a general redirect rule" do
          setup do
            Factory(:active_redirect_rule, :pattern => '^/login', :destination => '/v2/login')
          end

          should "redirect if the path matches" do
            get '/login'
            assert_redirected_to '/v2/login'
          end

          should "not redirect if the path does not match" do
            get '/'
            assert_not_redirected
          end
        end
      end
    end

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

    class MediaItem < ActiveRecord::Base
      named_scope :brightcove, :conditions => "identifier RLIKE '^[0-9]+$'"
      # ...
    end

[rlike]: http://dev.mysql.com/doc/refman/5.0/en/regexp.html

### [RLIKE][]

    def general_clause
      <<-SQL
        countries.code IS NULL AND
        :request_path RLIKE redirect_rules.pattern AND
        #{exception_clause}
      SQL
    end

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

### [git log --oneline --decorate][mislav]

    82bf5fb (HEAD, transmobilizer) Translator: basic translation middleware
    3fec5fb (origin/staging, origin/production, origin/master, origin/HEAD, staging, production, master)
    7211f57 Football: Added Sergio Panel, Resolves #2708
    376d7eb Puma.com: Fixed 'Like' button comment window in modals. Resolves #2702
    e6c7b19 Products: Updated GA tracking, Resolves #2670
    9ebeed6 Products: Updated data-track-trigger firing to include available products, Addresses #2670
    fe18621 PUMA.com: store-specific checkin feeds (fix #2696)`

[mislav]: http://mislav.uniqpath.com/2010/07/git-tips/

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

## 3. Larger Lessons &amp; Issues

### PM Turnover

### 40 vs. 32 Hr. Week

### Cross-Office Communication

### Release Planning

    ## Iteration 3 *(March 21-25)*

      * Search
      * Region-specific panel uploader
      * Promotions
      * Tags acting globally

    **Note:** Buildout starts; David out Monday; David and Carolyn in Boston Thu-Fri

    ## Iteration 4 *(March 28-April 1)*

      * Brightcove integration
      * Feeds
      * Facebook integration

### Sysadmin/Deploy Situation

### Ramping Up New Devs

### Bad Code

### Long Engagement

### Conclusion

## Thanks!

  * <https://github.com/dce/puma-dev-retro>
  * <https://github.com/nakajima/slidedown>
