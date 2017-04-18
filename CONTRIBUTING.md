# CONTRIBUTING
> Thanks for wanting to contribute!

The way we work on Groot is in a sort of bi-modal development mindset. We have 2 sets of development going on at once: __hardening__ development and __feature__ development.

We organize priorities though releases.

Releases termed X.0 are hardening releases and will contain mostly bug fixes and refinements to the overarching system.

Releases termed X.5 are feature releases and contain new ideas we want to implement.

We have release notes tracked in the main groot repo and you will likely see X.0/X.5 releases tracked in the same doc.

- [Groot v1.0/v1.5](https://github.com/acm-uiuc/groot/issues/24)

We use milestones then to track the specific issues in each release

Repos will be tagged once all issues in a release have been addressed (X.0 blocks a X.5 release, but not the other way around).

We track ongoing development on the Groot project board (https://github.com/orgs/acm-uiuc/projects/1)

## What you should work on

The core team (@aashishkapur @sameetandpotatoes @bcongdon @narendasan), focus mostly on X.0 releases and we want newer developers to start working on X.5 releases.

If you want to help out check the most recent release notes and pick and X.5 issue to work on. If you need help getting started checkout the README or ask us questions on the [Gitter](https://gitter.im/acm-uiuc/groot-development)

## Submitting Code Changes
If you are ready to put a pull request in, great!

## Things to verify:
- [ ] Make sure to tag the issue you are addressing in your comments if applicable. 
- [ ] Make sure any tests pass
- [ ] Make sure you stick to rough style guidelines
- [ ] Have you added the license header to any new files? 

After a quick discussion and maybe some changes requested, your code will get merged 


### Style Guidelines 
__Go__ (just us a linter basically):
```go
//Function Signatures:
func foo(arg1: int, arg2: bool) { 

//if/else 
if x == y {
  return x
}
return y 

//No non bracketed blocks
//wrong:
if x == 1
  return true 
//correct:
if x == 1 {
  return true
}
```

__JS__ (Use something like ESLint) 
```js
//Function Signatures:
function foo(arg1: int, arg2: bool) { 

//if/else 
if x == y {
  return x
}
return y 

//No non bracketed blocks
//wrong:
if x == 1
  return true 
//correct:
if x == 1 {
  return true
}
```
__Ruby__: 
  good indenting basically 

__Python__:
  You already have enough problems, we dont need to add anymore


### License Header 
```
Copyright © 2017, ACM@UIUC

This file is part of the Groot Project.  
 
The Groot Project is open source software, released under the University of Illinois/NCSA Open Source License. 
You should have received a copy of this license in a file with the distribution.
```
