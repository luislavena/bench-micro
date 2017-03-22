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
rack                     18544.85       100.0%
syro                     15454.22       83.33%
mustermann               15199.80       81.96%
roda                     15042.26       81.11%
cuba                     13948.11       75.21%
hobbit                   13898.69       74.95%
rack-response            13822.22       74.53%
rambutan                 10804.74       58.26%
brooklyn                  9938.15       53.59%
hanami-router             9469.52       51.06%
rackstep                  9089.18       49.01%
nancy                     8808.90        47.5%
nyny                      7720.06       41.63%
rails                     5810.33       31.33%
gin                       5549.02       29.92%
sinatra                   4441.61       23.95%
grape                     3345.01       18.04%
ramaze                    1936.36       10.44%
```
<!-- speed_table_end -->

#### Memory Allocation/Request
<!-- mem_table -->
```
Framework       Allocs/Req Memsize/Req
--------------------------------------
rack                    38        3256
syro                    43        3536
hobbit                  45        3808
roda                    45        3752
mustermann              51        4112
cuba                    53        4072
rack-response           56        5312
brooklyn                69        6412
nancy                   75        7644
nyny                    82        8396
rackstep                82        6008
rambutan                85        6848
hanami-router           90        7859
rails                  113       10311
gin                    198       17219
sinatra                212       15783
grape                  257       20236
ramaze                 464       41360
```
<!-- mem_table_end -->


These numbers were collected on:

- Ubuntu 15.10 64-bit (kernel: 4.2.0-35-generic)
- Dell XPS 13 (9343, QHD, Developer Edition)
- Intel® Core™ i7-5500U CPU @ 2.40GHz × 4
- 8GB RAM
- 256GB SSD
- ruby 2.2.4p230 (2015-12-16 revision 53155) [x86_64-linux]
