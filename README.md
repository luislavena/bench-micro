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

- [Rack](https://github.com/rack/rack) - [rack.ru](rack.ru)
- [Sinatra](https://github.com/sinatra/sinatra) - [sinatra.ru](sinatra.ru)
- [NYNY](https://github.com/alisnic/nyny) - [nyny.ru](nyny.ru)
- [Hobbit](https://github.com/patriciomacadden/hobbit) - [hobbit.ru](hobbit.ru)
- [Cuba](https://github.com/soveran/cuba) - [cuba.ru](cuba.ru)
- [Ramaze](https://github.com/Ramaze/ramaze) - [ramaze.ru](ramaze.ru)
- [Rambutan](https://github.com/NewRosies/rambutan) - [rambutan.ru](rambutan.ru)
- [Scorched](https://github.com/Wardrop/Scorched) - [scorched.ru](scorched.ru)
- [Brooklyn](https://github.com/luislavena/brooklyn) - [brooklyn.ru](brooklyn.ru)
- [Nancy](https://github.com/heapsource/nancy) - [nancy.ru](nancy.ru)
- [Rails](https://github.com/rails/rails) - [rails.ru](rails.ru)

Please note that while Rails has been added to the list, it is just a
minimalistic representation (using Metal, no full middleware stack, etc). You
shouldn't take the performance numbers mentioned here about Rails (or any
other) as scientific and decision-taking references.

## How?

Used [wrk](https://github.com/wg/wrk) to benchmark, locally, a burst of
requests (in 2 threads) over 10 seconds. The command line used was:

```console
$ wrk -t 2 http://localhost:port/
```

All the frameworks were run using [Puma](https://github.com/puma/puma) on
Ruby 2.1, in production mode and using 16 threads:

```console
$ puma -e production -t 16:16 <framework.ru>
```

### Have some numbers around?

Yup, I do:

```
Rack:     8777 req/sec (1.0x)
Cuba:     7559 req/sec (0.86x)
Hobbit:   7318 req/sec (0.83x)
Rack:     6783 req/sec (0.77x) (using Rack::Response)
Brooklyn: 6477 req/sec (0.74x)
Rambutan: 6025 req/sec (0.67x)
Nancy:    5775 req/sec (0.66x)
NYNY:     5206 req/sec (0.59x)
Sinatra:  2900 req/sec (0.33x)
Rails:    1619 req/sec (0.18x)
Scorched: 1581 req/sec (0.18x)
Ramaze:   1319 req/sec (0.15x)
```

These numbers were collected on:

- OSX, 10.8.5, MacBook Pro i5 (2.5GHz), 8GB 1600 MHz DDR3.
- Ruby 2.1.0p0 (GCC 4.7.3)
