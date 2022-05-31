Learn and practice the Racket language by fixing broken unit tests.

Test files are named after the topics they cover. When all tests run,
the test topic files will execute in an order based loosely on [The
Racket Guide](https://docs.racket-lang.org/guide/).


## Usage

[Install Racket](https://racket-lang.org/download/) and verify that
the `racket -v` command prints your chosen version.

Open `koans/all.rkt` to see the suggested reading order.

* Run `racket koans/<topic>.rkt` to run tests for a single topic.
* Run `racket koans/all.rkt` to run all tests.

The tests checked into this repository are **incorrect by design**.
The idea is to practice reading and writing Racket by making tests
pass. You'll use tests written by the common `rackunit` library, which
uses self-explanatory code.

Some tests use `?` to mark where you should answer. Later tests expect
you to write your own Racket code, and may use concepts from earlier
tests.

Please do not give away answers!
