# Dbt Demo: Jaffle Shop

A demo of a dbt self-contained project for transforming data from a fictional
e-commerce source.

## Introduction

Dbt Demo is an example of a software project that uses the [command-line
interface (CLI)][CLI] tool [`dbt`][dbt] to transform raw data into analytics-ready data
models. It began at version v0.1.0 with a set of starter files generated using
the command `dbt init`. Since then, it has iteratively evolved to depict what a
dbt could look like for a fictional e-commerce business: Jaffle Shop.

### What is This Repo?

What this repo _is_:

- A self-contained playground dbt project, useful for testing scripts and
  communicating some of the core dbt concepts.
- A demonstration of some [best practices][best practices], such as:
  - Dbt's standard file naming patterns (which make more sense on larger
      projects, rather than this five-model project)
  - Simple CI/CD integrations

What this repo _is not_:

- A tutorial — check out the [Getting Started Tutorial][tutorial] for that. Notably, this
  repo contains some anti-patterns to make it self-contained, namely the use of
  seeds instead of sources.
- A demonstration of other best practices — check out the [dbt Learn Demo][demo] repo
  instead. We want to keep this project as simple as possible. As such, we chose
  not to implement:
  - A merge request flow
  - More complex CI/CD integrations
- A demonstration of using dbt for a high-complex project, or a demo of advanced
  features (e.g. macros, packages, hooks, operations) — we're just trying to keep
  things simple here!

### What's in This Repo?

This repo contains [seeds][seeds] that includes some (fake) raw data from a fictional
app.

The raw data consists of customers, orders, and payments, with the following
entity-relationship diagram:

![Jaffle Shop ERD][ERD]

### WTF is a Jaffle?

A [jaffle][jaffle] is a toasted sandwich with crimped, sealed edges. Invented in [Bondi][Bondi] in
1949, the humble jaffle is an Australian classic. The sealed edges allow one to
enjoy liquid fillings inside the sandwich, which reach temperatures close to the
core of the earth during cooking. Often consumed at home after a night out, the
most classic filling is tinned spaghetti, while another favorite is leftover
beef stew with melted cheese.

## Getting Started

### System Requirements

Dbt Demo supports UNIX-flavored operating systems, including:

* [Linux][Linux]
* [macOS][macOS]
* [SunOS][SunOS]

It also supports the [Windows][Windows] operating system when used with
Microsoft's native [Windows Subsystem for Linux (WSL)][WSL] or a 3rd-party emulator
like Git BASH (part of [Git for Windows][Git for Windows]).

To use or test Dbt Demo, the following software must first be installed on your
system:

* [Python][Python] 3.7 or higher

To contribute to Dbt Demo's development and maintenance, the following [DevOps][DevOps]
[toolchain][toolchain] must also be installed:

* [Git][Git] 2.24.1 or higher
* [GitFlow][GitFlow] 0.4.1 or higher
* [pre-commit][pre-commit] v2.13.0 or higher

### Usage

Try running the following commands to see `dbt` in action:

```bash
dbt clean
dbt debug
dbt seed
dbt run
dbt test
dbt debug
dbt docs generate
dbt docs serve
```

For CI/CD purposes, try running this command:

```bash
pre-commit run --all-file
```

## Documentation

Documentation for Dbt Demo is this README itself, plus those listed in the
subsections that follow.

### Community Health

* [`CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md)
* [`CONTRIBUTING.md`](CONTRIBUTING.md)

### Other

* [`REFERENCES.md`](REFERENCES.md)
* [`REPO_SETUP.md`](REPO_SETUP.md)

## Known Issues

Currently, there are no known issues.

## Resources

- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

## References

API documentation, tutorials, and other online references and made portions of
this assignment possible. See [REFERENCES.md](REFERENCES.md) for a list of some.

[best practices]: https://docs.getdbt.com/guides/best-practices
[Bondi]: https://en.wikipedia.org/wiki/Bondi,_New_South_Wales
[CLI]: https://en.wikipedia.org/wiki/Command-line_interface
[dbt]: https://www.getdbt.com
[demo]: https://github.com/dbt-labs/dbt-learn-demo
[DevOps]: https://en.wikipedia.org/wiki/DevOps
[ERD]: etc/jaffle_shop_erd.png
[Git]: https://git-scm.com
[Git for Windows]: https://gitforwindows.org
[GitFlow]: https://github.com/nvie/gitflow
[jaffle]: https://australianfoodtimeline.com.au/jaffle-craze
[Linux]: https://www.linuxfoundation.org
[macOS]: https://www.apple.com/macos
[pre-commit]: https://github.com/pre-commit/pre-commit
[Python]: https://www.python.org
[seeds]: https://docs.getdbt.com/docs/building-a-dbt-project/seeds
[SunOS]: https://en.wikipedia.org/wiki/SunOS
[toolchain]: https://en.wikipedia.org/wiki/Toolchain
[tutorial]: https://docs.getdbt.com/tutorial/setting-up
[Windows]: https://www.microsoft.com/en-us/windows
[WSL]: https://docs.microsoft.com/en-us/windows/wsl/about
