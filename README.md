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
- [Scorched](https://github.com/Wardrop/Scorched) - [scorched.ru](scorched.ru)
- [Brooklyn](https://github.com/luislavena/brooklyn) - [brooklyn.ru](brooklyn.ru)
- [Nancy](https://github.com/heapsource/nancy) - [nancy.ru](nancy.ru)

## How?

Used [wrk](https://github.com/wg/wrk) to benchmark, locally, a burst of
requests (in 2 threads) over 10 seconds. The command line used was:

```console
$ wrk -t 2 http://localhost:port/
```

All the frameworks were run using [Puma](https://github.com/puma/puma) on
Ruby 2.0, in production mode and using 16 threads:

```console
$ puma -e production -t 16:16 <framework.ru>
```

### Have some numbers around?

Yup, I do:

```
Rack:     7637 req/sec (1.0x)
Cuba:     6645 req/sec (0.87x)
Brooklyn: 5827 req/sec (0.76x)
Hobbit:   5621 req/sec (0.73x)
Nancy:    5334 req/sec (0.69x)
NYNY:     4923 req/sec (0.64x)
Sinatra:  2712 req/sec (0.35x)
Scorched: 1626 req/sec (0.21x)
Ramaze:   1090 req/sec (0.14x)
```
