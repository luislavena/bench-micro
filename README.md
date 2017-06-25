# bench some web microframeworks (Ruby)

Because we don't have enough drama, let's bench some *hello world* apps!

## Why?

As part of some research, collected some benchmark around Ruby web
microframeworks.

The idea is bench the performance from [Rack](https://github.com/rack/rack),
throught the stack of the framework to the minimum representation of an
application (*Hello World* apps).

It is not the goal to bechmark hits to the database or external services,
nor to do a silly *fibonacci-as-a-service*, ok?

## What?

Rack 2 compatible frameworks

- [Cuba](https://github.com/soveran/cuba) - [cuba.ru](apps/cuba.ru)
- [Flame](https://github.com/AlexWayfer/flame) - [flame.ru](apps/flame.ru)
- [Grape](https://github.com/ruby-grape/grape) - [grape.ru](apps/grape.ru)
- [Hanami (Router)](https://github.com/hanami/router) - [hanami-router.ru](apps/hanami-router.ru)
- [Hobbit](https://github.com/patriciomacadden/hobbit) - [hobbit.ru](apps/hobbit.ru)
- [Newark](https://github.com/mje113/newark) - [newark.ru](apps/newark.ru)
- [Plezi](https://github.com/boazsegev/plezi) - [plezi.ru](apps/plezi.ru)
- [Rack](https://github.com/rack/rack) - [rack.ru](apps/rack.ru) + [rack-response.ru](apps/rack-response.ru)
- [Rack-App](https://github.com/rack-app/rack-app) - [rack-app.ru](apps/rack-app.ru)
- [RackStep](https://github.com/mfdavid/rackstep) - [rackstep.ru](apps/rackstep.ru)
- [Rails (API + Metal)](https://github.com/rails/rails) - [rails-api.ru](apps/rails-api.ru)  + [rails-metal.ru](apps/rails-metal.ru)
- [Rambutan](https://github.com/NewRosies/rambutan) - [rambutan.ru](apps/rambutan.ru)
- [Roda](https://github.com/jeremyevans/roda) - [roda.ru](apps/roda.ru)
- [Sinatra](https://github.com/sinatra/sinatra) - [sinatra.ru](apps/sinatra.ru)
- [Syro](https://github.com/soveran/syro) - [syro](apps/syro.ru)
- [Watts](https://github.com/pete/watts) - [watts](apps/watts.ru)

Please note that while Rails has been added to the list, it is just a
minimalistic representation with ActionPack gem (using API and Metal, no full middleware stack, etc). You
shouldn't take the performance numbers mentioned here about Rails (or any
other) as scientific and decision-taking references.

## How?

Used [wrk](https://github.com/wg/wrk) to benchmark, locally, a burst of
requests (in 2 threads) over 10 seconds. The command line used was:

```console
$ wrk -t 2 http://localhost:9292/
```

All the frameworks using [Puma](https://github.com/puma/puma) on
Ruby 2.4, in production mode with 16 threads:

```console
$ puma -e production -t 16:16 apps/<framework.ru>
```

## Run benchmark for all frameworks

```console
# use `bundle exec`, if needed
$ bench/summary-memory
$ bench/summary-speed
```

### Have some numbers around?

Yup, I do:

#### Requests/sec
<!-- speed_table -->
```
Framework            Requests/sec  % from best
----------------------------------------------
rack                     19860.11      100.00%
syro                     12880.79       64.86%
watts                    12838.11       64.64%
roda                     12805.01       64.48%
cuba                     12676.64       63.83%
hanami-router            12313.15       62.00%
hobbit                   12112.75       60.99%
rack-response            10395.30       52.34%
newark                    8991.21       45.27%
rackstep                  8531.32       42.96%
rambutan                  8281.52       41.70%
rack-app                  7466.27       37.59%
flame                     6463.42       32.54%
rails-metal               6219.34       31.32%
sinatra                   3832.45       19.30%
grape                     3458.29       17.41%
rails-api                 1185.43        5.97%
```
<!-- speed_table_end -->

#### Memory Allocation/Request
<!-- mem_table -->
```
Framework       Allocs/Req Memsize/Req
--------------------------------------
rack                    34        2640
roda                    38        3328
syro                    38        3328
cuba                    40        3408
watts                   41        2920
hobbit                  42        3648
rack-response           49        3856
rails-metal             53        5448
hanami-router           61        4600
newark                  65        5648
rackstep                74        4664
rack-app                76        6904
rambutan                76        5664
flame                   94        7077
sinatra                181       11992
grape                  237       17168
rails-api              375       27440
```
<!-- mem_table_end -->

#### Hardware

These numbers were collected on:

- Ubuntu 16.10 64-bit (kernel: 4.8.0-41-generic)
- Dell XPS 13 (9343, QHD, Developer Edition)
- Intel® Core™ i7-5500U CPU @ 2.40GHz × 4
- 8GB RAM
- 256GB SSD
- ruby 2.4.0p0 (2016-12-24 revision 57164) [x86_64-linux]
