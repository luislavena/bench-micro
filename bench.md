# rack

## webrick

```
Running 10s test @ http://localhost:9292/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    20.78ms    8.01ms  57.97ms   69.82%
    Req/Sec   245.74     34.01   326.00     62.80%
  4878 requests in 10.00s, 0.86MB read
Requests/sec:    487.66
Transfer/sec:     88.14KB
```

## puma

```
Running 10s test @ http://localhost:9292/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.84ms    2.26ms  17.50ms   91.69%
    Req/Sec     3.38k     1.24k    5.33k    63.63%
  63557 requests in 10.00s, 4.61MB read
Requests/sec:   6355.62
Transfer/sec:    471.73KB
```

# sinatra

## webrick

```
Running 10s test @ http://localhost:9292/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    24.17ms    9.52ms  79.02ms   76.42%
    Req/Sec   211.62     24.82   268.00     67.69%
  4192 requests in 10.00s, 1.18MB read
Requests/sec:    419.17
Transfer/sec:    120.37KB
```

## puma

```
Running 10s test @ http://localhost:9292/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     5.76ms    3.78ms  30.83ms   74.97%
    Req/Sec     0.89k   146.10     1.32k    66.51%
  17470 requests in 10.00s, 3.08MB read
Requests/sec:   1746.91
Transfer/sec:    315.67KB
```

# cuba

## webrick

```
Running 10s test @ http://localhost:9292/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    22.70ms    8.04ms  60.12ms   74.27%
    Req/Sec   222.55     28.48   290.00     70.36%
  4425 requests in 10.00s, 864.62KB read
Requests/sec:    442.49
Transfer/sec:     86.46KB
```

## puma

```
Running 10s test @ http://localhost:9292/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     2.16ms    2.47ms  12.86ms   91.25%
    Req/Sec     2.87k     1.10k    4.67k    66.61%
  54049 requests in 10.00s, 4.69MB read
Requests/sec:   5404.79
Transfer/sec:    480.32KB
```

# nyny

## webrick

```
Running 10s test @ http://localhost:9292/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    23.74ms    9.25ms  74.28ms   74.05%
    Req/Sec   211.79     26.36   275.00     69.55%
  4221 requests in 10.00s, 763.09KB read
Requests/sec:    421.96
Transfer/sec:     76.28KB
```

## puma

```
Running 10s test @ http://localhost:9292/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     3.30ms    2.99ms  16.83ms   86.33%
    Req/Sec     1.77k   693.51     3.17k    59.25%
  33907 requests in 10.00s, 2.46MB read
Requests/sec:   3390.67
Transfer/sec:    251.68KB
```

# hobbit

## webrick

```
Running 10s test @ http://localhost:9292/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    17.56ms    4.70ms  42.19ms   74.29%
    Req/Sec   287.24     24.83   367.00     66.07%
  5703 requests in 10.00s, 1.09MB read
Requests/sec:    570.22
Transfer/sec:    111.39KB
```

## puma

```
Running 10s test @ http://localhost:9292/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     2.41ms    2.37ms  15.11ms   82.80%
    Req/Sec     2.76k     1.17k    4.44k    65.76%
  52094 requests in 10.00s, 4.52MB read
Requests/sec:   5209.22
Transfer/sec:    462.94KB
```
