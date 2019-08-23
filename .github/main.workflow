workflow "npm build, lint, test and publish" {
  on       = "push"

  resolves = [
    "docker build"
  ]
}

action "npm install" {
  uses = "actions/npm@master"
  args = "install"
}

action "npm lint" {
  needs = "npm install"
  uses  = "actions/npm@master"
  args  = "run lint"
}

action "npm test" {
  needs = "npm install"
  uses  = "actions/npm@master"
  args  = "run test"
}

action "docker build" {
  uses  = "actions/docker/cli@master"
  args  = "build -t abhinavdhasmana/github-action-example-node ."

  needs = [
    "npm lint",
    "npm test"
  ]
}
