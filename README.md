# Rails Rust csv test

This is a test project for integrating Rust into a workable Rails application.
It's just an experiment.


### Ruby
```shell
Started GET "/sample/ruby" for ::1
Processing by SampleController#ruby as HTML
Completed 200 OK in 2011ms (Views: 1627.0ms | ActiveRecord: 0.0ms)
```

### Rust
```shell
Started GET "/sample/rust" for ::1
Processing by SampleController#rust as HTML
Completed 200 OK in 61ms (Views: 0.9ms | ActiveRecord: 0.0ms)
```
