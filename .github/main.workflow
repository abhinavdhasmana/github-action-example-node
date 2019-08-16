workflow "npm build, lint, test and publish" {
  on       = "push"

  resolves = [
    "lint",
    "test"
  ]
}

action "build" {
  uses = "actions/npm@master"
  args = "install"
}

action "lint" {
  needs = "build"
  uses  = "actions/npm@master"
  args  = "run lint"
}

action "test" {
  needs = "build"
  uses  = "actions/npm@master"
  args  = "run test"
}
