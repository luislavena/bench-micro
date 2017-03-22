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
- [Rack](https://github.com/rack/rack) - [rack.ru](apps/rack.ru) + [rack-response.ru](apps/rack-response.ru)
- [Rack-App](https://github.com/rack-app/rack-app) - [rack-app.ru](apps/rack-app.ru)
- [RackStep](https://github.com/mfdavid/rackstep) - [rackstep.ru](apps/rackstep.ru)
- [Rails (API + Metal)](https://github.com/rails/rails) - [rails-api.ru](apps/rails-api.ru)  + [rails-metal.ru](apps/rails-metal.ru)
- [Rambutan](https://github.com/NewRosies/rambutan) - [rambutan.ru](apps/rambutan.ru)
- [Roda](https://github.com/jeremyevans/roda) - [roda.ru](apps/roda.ru)
- [Sinatra](https://github.com/sinatra/sinatra) - [sinatra.ru](apps/sinatra.ru)
- [Syro](https://github.com/soveran/syro) - [syro](apps/syro.ru)

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
rack                     15730.90      100.00%
watts                    14157.61       90.00%
mustermann               13235.57       84.14%
syro                     12937.25       82.24%
roda                     12830.23       81.56%
hobbit                   12231.93       77.76%
rack-response            11614.01       73.83%
cuba                     11586.47       73.65%
rambutan                  9477.59       60.25%
brooklyn                  9209.93       58.55%
rackstep                  8920.60       56.71%
hanami-router             8766.85       55.73%
nancy                     8092.11       51.44%
nyny                      7207.98       45.82%
rails                     5264.29       33.46%
gin                       5181.64       32.94%
sinatra                   4161.55       26.45%
grape                     3227.50       20.52%
ramaze                    1676.37       10.66%
```
<!-- speed_table_end -->

#### Memory Allocation/Request
<!-- mem_table -->
```
Framework       Allocs/Req Memsize/Req
--------------------------------------
rack                    38        3272
syro                    44        4088
hobbit                  46        4360
roda                    46        4264
watts                   47        3632
mustermann              49        4048
cuba                    53        4544
rack-response           56        4896
brooklyn                70        6924
nancy                   76        7764
rackstep                82        5632
nyny                    83        8516
rambutan                85        6432
hanami-router           90        7875
rails                  113       10247
gin                    197       16659
sinatra                212       15247
grape                  258       20332
ramaze                 466       40985
```
<!-- mem_table_end -->


These numbers were collected on:

- Ubuntu 15.10 64-bit (kernel: 4.2.0-35-generic)
- Dell XPS 13 (9343, QHD, Developer Edition)
- Intel® Core™ i7-5500U CPU @ 2.40GHz × 4
- 8GB RAM
- 256GB SSD
- ruby 2.2.4p230 (2015-12-16 revision 53155) [x86_64-linux]
