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

The following microframeworks were considered when doing this research:

- [Brooklyn](https://github.com/luislavena/brooklyn) - [brooklyn.ru](apps/brooklyn.ru)
- [Cuba](https://github.com/soveran/cuba) - [cuba.ru](apps/cuba.ru)
- [Gin](https://github.com/jcasts/gin) - [gin.ru](apps/gin.ru)
- [Hanami (Router)](https://github.com/hanami/router) - [hanami-router.ru](apps/hanami-router.ru)
- [Hobbit](https://github.com/patriciomacadden/hobbit) - [hobbit.ru](apps/hobbit.ru)
- [Nancy](https://github.com/heapsource/nancy) - [nancy.ru](apps/nancy.ru)
- [NYNY](https://github.com/alisnic/nyny) - [nyny.ru](apps/nyny.ru)
- [Mustermann](https://github.com/rkh/mustermann) - [mustermann.ru](apps/mustermann.ru)
- [Rack](https://github.com/rack/rack) - [rack.ru](apps/rack.ru) + [rack-response.ru](apps/rack-response.ru)
- ~~[Rails](https://github.com/rails/rails) - [rails.ru](apps/rails.ru)~~
- [Ramaze](https://github.com/Ramaze/ramaze) - [ramaze.ru](apps/ramaze.ru)
- [Rambutan](https://github.com/NewRosies/rambutan) - [rambutan.ru](apps/rambutan.ru)
- [Roda](https://github.com/jeremyevans/roda) - [roda.ru](apps/roda.ru)
- [Scorched](https://github.com/Wardrop/Scorched) - [scorched.ru](apps/scorched.ru)
- [Sinatra](https://github.com/sinatra/sinatra) - [sinatra.ru](apps/sinatra.ru)
- [Syro](https://github.com/soveran/syro) - [syro](apps/syro.ru)

Please note that while Rails has been added to the list, it is just a
minimalistic representation (using Metal, no full middleware stack, etc). You
shouldn't take the performance numbers mentioned here about Rails (or any
other) as scientific and decision-taking references.

## How?

Used [wrk](https://github.com/wg/wrk) to benchmark, locally, a burst of
requests (in 2 threads) over 10 seconds. The command line used was:

```console
$ wrk -t 2 http://localhost:9292/
```

All the frameworks were run using [Puma](https://github.com/puma/puma) on
Ruby 2.1, in production mode and using 16 threads:

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
rack                     18639.51       100.0%
mustermann               15263.92       81.89%
syro                     15127.53       81.16%
roda                     15013.33       80.55%
cuba                     13889.65       74.52%
hobbit                   13595.20       72.94%
rack-response            13414.93       71.97%
rambutan                 10948.59       58.74%
brooklyn                  9987.20       53.58%
hanami-router             9486.78        50.9%
nancy                     8938.53       47.95%
nyny                      8132.90       43.63%
rails                     5817.82       31.21%
gin                       5699.87       30.58%
sinatra                   4468.89       23.98%
ramaze                    1933.04       10.37%
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
rambutan                85        6848
hanami-router           90        7859
rails                  113       10311
gin                    198       17219
sinatra                212       15783
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
