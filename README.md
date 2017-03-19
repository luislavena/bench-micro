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
- [Grape](https://github.com/ruby-grape/grape) - [grape.ru](apps/grape.ru)
- [Hanami (Router)](https://github.com/hanami/router) - [hanami-router.ru](apps/hanami-router.ru)
- [Hobbit](https://github.com/patriciomacadden/hobbit) - [hobbit.ru](apps/hobbit.ru)
- [Rack](https://github.com/rack/rack) - [rack.ru](apps/rack.ru) + [rack-response.ru](apps/rack-response.ru)
- [Rack-App](https://github.com/rack-app/rack-app) - [rack-app.ru](apps/rack-app.ru)
- [RackStep](https://github.com/mfdavid/rackstep) - [rackstep.ru](apps/rackstep.ru)
- [Rails (API)](https://github.com/rails/rails) - [rails.ru](apps/rails-api.ru)
- [Rambutan](https://github.com/NewRosies/rambutan) - [rambutan.ru](apps/rambutan.ru)
- [Roda](https://github.com/jeremyevans/roda) - [roda.ru](apps/roda.ru)
- [Sinatra](https://github.com/sinatra/sinatra) - [sinatra.ru](apps/sinatra.ru)
- [Syro](https://github.com/soveran/syro) - [syro](apps/syro.ru)

## How?

Used [wrk](https://github.com/wg/wrk) to benchmark, locally, a burst of
requests (in 2 threads) over 10 seconds. The command line used was:

```console
$ wrk -t 2 http://localhost:9292/
```

All the frameworks using [Puma](https://github.com/puma/puma) on
Ruby 2.4, in production mode and starts 16 threads:

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
rack                      8392.73       100.0%
syro                      7493.37       89.28%
roda                      7126.44       84.91%
hobbit                    7037.02       83.85%
cuba                      6842.70       81.53%
hanami-router             6627.27       78.96%
rack-response             6285.45       74.89%
rambutan                  5317.21       63.35%
rack-app                  4912.31       58.53%
rackstep                  3982.89       47.46%
sinatra                   2543.77       30.31%
grape                     2251.54       26.83%
rails-api                  927.63       11.05%
```
<!-- speed_table_end -->

#### Memory Allocation/Request
<!-- mem_table -->
```
Framework       Allocs/Req Memsize/Req
--------------------------------------
rack                    34        2640
syro                    38        3328
roda                    38        3328
cuba                    40        3408
hobbit                  42        3648
rack-response           49        3856
hanami-router           61        4600
rackstep                74        4664
rambutan                76        5664
rack-app                76        6904
sinatra                182       12008
grape                  237       17168
rails-api              378       27576
```
<!-- mem_table_end -->


Test environment:

- MacBook Pro (13-inch, Early 2011)
- 2,3 GHz Intel Core i5
- 16 GB 1867 MHz DDR3
- Crucial 250MX200 SSD
- ruby 2.4.0p0 (2016-12-24 revision 57164) [x86_64-darwin16]
