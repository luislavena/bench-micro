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
- [Hobby](https://github.com/ch1c0t/hobby) - [hobby.ru](apps/hobby.ru)
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
rack                     16339.26      100.00%
watts                    15259.49       93.39%
syro                     13803.82       84.48%
roda                     12268.70       75.09%
hanami-router            11818.36       72.33%
cuba                     11451.53       70.09%
hobbit                   11337.03       69.39%
rack-response            11273.67       69.00%
hobby                    10152.60       62.14%
newark                    9596.83       58.73%
plezi                     9219.48       56.43%
rambutan                  9108.58       55.75%
rackstep                  8124.54       49.72%
rack-app                  7693.54       47.09%
rails-metal               6750.78       41.32%
sinatra                   4123.50       25.24%
grape                     3348.19       20.49%
rails-api                 1222.69        7.48%
```
<!-- speed_table_end -->

#### Memory Allocation/Request
<!-- mem_table -->
```
Framework       Allocs/Req Memsize/Req
--------------------------------------
rack                    41        2920
roda                    45        3608
syro                    45        3608
cuba                    47        3688
watts                   48        3200
hobbit                  49        3928
hobby                   54        4320
rack-response           56        4136
rails-metal             60        5728
plezi                   66        5040
hanami-router           68        4880
newark                  72        5928
rackstep                81        4944
rack-app                83        7184
rambutan                83        5944
sinatra                191       12512
grape                  258       18888
rails-api              378       27737
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
