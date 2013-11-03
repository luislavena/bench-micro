# rack

## webrick

```
Running 10s test @ http://localhost:9292/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    14.17ms    4.51ms  32.83ms   70.76%
    Req/Sec   365.74     45.44   461.00     76.48%
  7221 requests in 10.00s, 1.27MB read
Requests/sec:    722.34
Transfer/sec:    130.50KB
```

## puma

```
Running 10s test @ http://localhost:9292/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.41ms    1.56ms   9.18ms   93.31%
    Req/Sec     4.09k     1.28k    6.11k    61.97%
  77326 requests in 10.00s, 5.60MB read
Requests/sec:   7732.80
Transfer/sec:    573.92KB
```

# sinatra

## webrick

```
Running 10s test @ http://localhost:9292/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    16.22ms    5.44ms  37.09ms   72.16%
    Req/Sec   306.55     34.97   395.00     67.03%
  6057 requests in 10.00s, 1.70MB read
Requests/sec:    605.66
Transfer/sec:    173.89KB
```

## puma

```
Running 10s test @ http://localhost:9292/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.95ms    2.47ms  13.94ms   92.75%
    Req/Sec     3.43k     1.14k    4.67k    81.63%
  32484 requests in 10.00s, 5.73MB read
  Socket errors: connect 0, read 0, write 0, timeout 25
Requests/sec:   3246.96
Transfer/sec:    586.64KB
```

# cuba

## webrick

```
Running 10s test @ http://localhost:9292/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    15.46ms    4.50ms  33.58ms   69.37%
    Req/Sec   333.08     41.32   428.00     69.82%
  6604 requests in 10.00s, 1.26MB read
Requests/sec:    660.30
Transfer/sec:    128.97KB
```

## puma

```
Running 10s test @ http://localhost:9292/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   479.60us    0.91ms   7.43ms   97.89%
    Req/Sec     7.09k     2.15k    9.56k    67.66%
  66963 requests in 10.00s, 5.81MB read
  Socket errors: connect 0, read 0, write 0, timeout 28
Requests/sec:   6694.21
Transfer/sec:    594.90KB
```

# nyny

## webrick

```
Running 10s test @ http://localhost:9292/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    15.00ms    5.13ms  39.29ms   69.46%
    Req/Sec   336.63     44.49   441.00     67.13%
  6653 requests in 10.00s, 1.17MB read
Requests/sec:    665.18
Transfer/sec:    120.17KB
```

## puma

```
Running 10s test @ http://localhost:9292/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   558.61us    1.95ms   9.92ms   95.46%
    Req/Sec     5.79k     1.92k    8.56k    69.28%
  54663 requests in 10.00s, 3.96MB read
  Socket errors: connect 0, read 0, write 0, timeout 36
Requests/sec:   5464.48
Transfer/sec:    405.57KB
```

# hobbit

## webrick

```
Running 10s test @ http://localhost:9292/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    15.14ms    4.61ms  34.11ms   69.27%
    Req/Sec   334.69     45.78   475.00     70.60%
  6618 requests in 10.00s, 1.26MB read
Requests/sec:    661.69
Transfer/sec:    129.24KB
```

## puma

```
Running 10s test @ http://localhost:9292/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.37ms    1.70ms  10.74ms   94.40%
    Req/Sec     3.05k     1.72k    6.44k    56.93%
  57557 requests in 10.00s, 5.00MB read
  Socket errors: connect 0, read 0, write 0, timeout 12
Requests/sec:   5755.84
Transfer/sec:    511.51KB
```
