PUMA Dev Retrospective
======================

[github.com/dce/puma-dev-retro][github]

[github]: https://github.com/dce/puma-dev-retro

## PUMA Dev Retro

  1. Tips &amp; Techniques
  2. Larger Issues/Lessons

## 1. Tips

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

### [Preflight Tasks][preflight]

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

## 2. Larger Issues/Lessons

### PM Turnover

### 40 vs. 32 Hr. Week

### Cross-Office Communication

### Release Planning

## Thanks!

  * <https://github.com/dce/puma-dev-retro>
  * <https://github.com/nakajima/slidedown>

* * *

  * Sysadmin/Deploy Situation
  * Burnout
  * Ramping Up New Devs
  * Bad Code
  * Long Engagement
  * Modules
  * Test Macros
  * Integration/Stack Testing
  * Typus
  * Akamai
