# geOrchestra runtime tests

## Requirements

- ruby, bundler
- chromium, chromedriver

By default, the instrumented browser will be chrome/chromium, but it is also
possible to run the testsuite under firefox.

## Install

```
$ sudo apt-get install bundler chromedriver

```

Then, once in the source tree:

```
$ bundle install
```

Under `debian8`, the `chromedriver` is not available in the `PATH` by default,
so you will have to add it to the environment variable before launching the
tests:

```
$ export PATH=$PATH:/usr/lib/chromium
```

## Launch a single test

To launch a single test (e.g. geoserver), use the following command:

```
$ bundle exec rspec spec/features/geoserver_spec.rb
```

An HTML report will then be available into the current directory under the
filename `rspec_result.html`.

## Launch the whole testsuite

The default rake task is to launch the whole scenarios, so launching the
following command will play the whole testsuite:

```
$ bundle exec rake
```

The HTML report will be generated under `reports/rspec_results.html`.

## customizing the web application being tested

Modify the file `spec/spec_helper.rb`, which contains the variable
`Capybara.app_host`.

Some credentials are hardcoded, you might want to adapt the testsuite if you are targetting another application.
