# Welcome to the Bentoo!

## Repoman status

[![Build Status][ci-master-badge]][ci-master]

## Contact

[![Gitter chat][gitter-badge]][gitter]

## Mirrors

The overlay is hosted on BitBucket and on Github at:

- https://bitbucket.org/redeyeteam/bentoo
- https://github.com/redeyeteam/bentoo

## Quality Assurance

You should be able to use any package from my overlay without regrets, because I do and I have quite high standards.
To achieve this goal I'm using several safety guards:

- my brain of course
- _[Travis CI](https://travis-ci.org/)_, which runs:
    - _[repoman](https://wiki.gentoo.org/wiki/Repoman)_ checks
    - _[shellcheck](https://www.shellcheck.net/)_ checks
    - custom checks
- all points of _GitHub_'s feature called _[protected branches]_, which means that all merges to _master_ must pass CI tests

This all, of course, doesn't prevent build failures, missing dependencies, etc. So, should you find
some issues, please send me a PR (if you know how to fix it), or at least [file an issue][New bitbucket issue] or [on github][New github issue].

---

[protected branches]: https://help.github.com/articles/about-protected-branches/
[New bitbucket issue]: https://bitbucket.org/redeyeteam/bentoo/issues/new
[New github issue]: https://github.com/redeyeteam/bentoo/issues/new
[ci-master-badge]: https://travis-ci.org/redeyeteam/bentoo.svg?branch=master
[ci-master]: https://travis-ci.org/redeyeteam/bentoo
[gitter-badge]: https://badges.gitter.im/redeyeteam/bentoo.png
[gitter]: https://gitter.im/redeyeteam/bentoo
