# Project Euler

[Project Euler](https://projecteuler.net/ "Project Euler's website") is a website dedicated to a series of [computational problems](https://projecteuler.net/archives) intended to be solved with computer programs.
Problems are of varying difficulty but each is solvable, as they say,
in less than a minute using an efficient algorithm on a modestly-powered computer.<sup>[1](https://en.wikipedia.org/wiki/Project_Euler)</sup>

I try to solve, at the very least, one problem each day. And I often solve these problems sequentially.
If I am unable to do so in an hour; 2 hours tops -- I usually just suck it up and drop it from my TODOs;
carrying on the day after. This cycle will continue *until* I'm able to solve it; with each day differing in mindset
and approach.

This repository is a collection of all my solutions to said problems.

**Open these files at your own risk** -- unless you're viewing them for hiring purposes and/or for kicks.
If you plan to give Project Euler some (much-needed) loving as well, I highly advise against checking these solutions out,
as it would surely influence how you'd go about solving them yourself.

> "Real learning is an active process, and seeing how it is done is a long way from experiencing that epiphany of discovery." <br/>
> -- Project Euler, on searching solutions online

Often, the true value of a thing isn't the thing itself, but instead the activity that created it;
so looking at someone else's solution would drain all the fun out of your ~learning experience~.


## How to run the files

To see the solution of a particular problem, simply clone this repository
and type the following command in your terminal:

```sh
$ ruby <problem_number>.rb
```

This is of course, assuming you have Ruby installed on your computer.

## Output

The program will output the solution for Problem <problem_number>,
and the time it took to find  that solution.

For instance:

```sh
$ ruby 21.rb
The sum of all amicable numbers under 10,000 is 31626
Time elapsed (in seconds):   0.220000   0.010000   0.230000 (  0.267515)
```