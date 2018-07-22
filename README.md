Learn the Racket language by fixing unit tests related to language features.

Use this project if you are just starting out and want isolated exercises
to practice taking baby-steps before working on larger projects.

Test files are named after the topics they cover, and execute in an
order based loosely on [The Racket Guide](https://docs.racket-lang.org/guide/).

## Usage

[Install Racket](https://racket-lang.org/download/) and make sure all of its
commands are available to your shell.

* Run `racket koans/<topic>.rkt` to run tests for a topic.
* Run `racket koans/all.rkt` to run all tests.

Read `koans/all.rkt` to see suggested reading order.

To practice, open a topic file and make all tests pass. Often times
`"?"` will mark where you are expected to write an answer.


## Contributing

It's too early to formalize a procedure, but I am happy and grateful
to look at any PRs you open. Since this codebase consists of intentionally
failing unit tests, I cannot accept already &ldquo;solved&rdquo; exercises,
although having some passing unit tests to set context for an exercise is okay.

If you are also learning Racket, you can contribute by checking out changes
made in a PR and verifying that:

1. The koans provided make sense for their topic.
2. They can be fixed with reasonable effort.

For honor reasons, please do not spoil answers. If you must mention a possible
solution, please keep it to pedagogical discussions.

I do ask that commit messages and PR titles make it clear what topics you are
contributing toward to make history easier to scan.

## Current project goals

* Better CLI usage for run all tests, or selected tests by topic. Support running tests automatically via file watching.
* Gauge community interest and nurture growth if project is helpful.
