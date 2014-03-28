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

- [Brooklyn](https://github.com/luislavena/brooklyn) - [brooklyn.ru](brooklyn.ru)
- [Cuba](https://github.com/soveran/cuba) - [cuba.ru](cuba.ru)
- [Hobbit](https://github.com/patriciomacadden/hobbit) - [hobbit.ru](hobbit.ru)
- [Lotus (Router)](https://github.com/lotus/router) - [lotus-router.ru](lotus-router.ru)
- [Nancy](https://github.com/heapsource/nancy) - [nancy.ru](nancy.ru)
- [NYNY](https://github.com/alisnic/nyny) - [nyny.ru](nyny.ru)
- [Mustermann](https://github.com/rkh/mustermann) - [mustermann.ru](mustermann.ru)
- [Rack](https://github.com/rack/rack) - [rack.ru](rack.ru)
- [Rails](https://github.com/rails/rails) - [rails.ru](rails.ru)
- [Ramaze](https://github.com/Ramaze/ramaze) - [ramaze.ru](ramaze.ru)
- [Rambutan](https://github.com/NewRosies/rambutan) - [rambutan.ru](rambutan.ru)
- [Scorched](https://github.com/Wardrop/Scorched) - [scorched.ru](scorched.ru)
- [Sinatra](https://github.com/sinatra/sinatra) - [sinatra.ru](sinatra.ru)

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
$ puma -e production -t 16:16 <framework.ru>
```

## Run benchmark for all frameworks
    $ sh/summary


### Have some numbers around?

Yup, I do:

```
rack:             8789.20 req/sec (1.00x)
mustermann:       7939.33 req/sec (0.90x)
cuba:             7646.59 req/sec (0.87x)
lotus-router:     7498.46 req/sec (0.85x)
hobbit:           7393.50 req/sec (0.84x)
rack-response:    6868.09 req/sec (0.78x)
brooklyn:         6179.54 req/sec (0.70x)
rambutan:         6121.30 req/sec (0.70x)
nancy:            5923.70 req/sec (0.67x)
nyny:             5291.87 req/sec (0.60x)
sinatra:          2984.99 req/sec (0.34x)
rails:            1774.22 req/sec (0.20x)
scorched:         1733.39 req/sec (0.20x)
ramaze:           1468.58 req/sec (0.17x)
```

These numbers were collected on:

- OSX, 10.8.5, MacBook Pro i5 (2.5GHz), 8GB 1600 MHz DDR3.
- Ruby 2.1.0p0 (GCC 4.7.3)
