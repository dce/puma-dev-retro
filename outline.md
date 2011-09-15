PUMA Dev Retrospective
======================

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

### [`git cherry`][cherry]

    + 497034f2 Listener.new now accepts a hash of options
    - 2d0333ff cache the absolute images path for growl messages
    + e4406858 rename Listener#run to #start

[cherry]: http://www.kernel.org/pub/software/scm/git/docs/git-cherry.html

### [Preflight Tasks][preflight]

[preflight]: http://www.viget.com/extend/testing-your-codes-text/

### [`.presence`][presence]

    title.present? ? title : label

    # versus

    title.presence || label

[presence]: http://rubyquicktips.com/post/9247085311/directly-access-an-object-if-its-present

### Branches

  * master/staging/production/etc.
  * `git log --oneline --decorate`

## 2. Larger Issues/Lessons

### PM Difficulties

### 40 vs. 32 Hr. Week

### Cross-Office Communication

### Release Planning

## Thanks!

  * <https://github.com/dce/puma-dev-retro>
  * <https://github.com/nakajima/slidedown>

* * *

Sysadmin/Deploy Situation
Burnout
Ramping Up New Devs
Bad Code
Long Engagement
Modules
Test Macros
Integration/Stack Testing
Typus
Random Gems
