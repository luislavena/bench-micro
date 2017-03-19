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
rack                      8457.42       100.0%
syro                      7579.01       89.61%
roda                      7186.54       84.97%
hobbit                    6994.16        82.7%
cuba                      6985.13       82.59%
hanami-router             6767.20       80.01%
rambutan                  5483.29       64.83%
rack-app                  5033.19       59.51%
rackstep                  4033.93        47.7%
sinatra                   2570.05       30.39%
grape                     2287.61       27.05%
rails-api                  944.77       11.17%
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
hanami-router           61        4600
rackstep                74        4664
rack-app                76        6904
rambutan                76        5664
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
