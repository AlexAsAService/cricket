# cricket

## 0.1.1

### Patch Changes

- 50147a7: Add a dedicated health check endpoint

## 0.1.0

### Minor Changes

- be91fd8: Stop supporting buildah

## 0.0.8

### Patch Changes

- c4aaf41: Use CHANGESETS_PAT to push version tag so publish job will trigger

## 0.0.7

### Patch Changes

- 0aff917: Automate version tag generation on commit into master with a version bump(version in package.json doesn't have a tag yet). Also only run changesets if this is not a push of a fresh version bump.

## 0.0.3

### Patch Changes

- 0544027: Add docker hub to the list of publish targets

## 0.0.3

### Patch Changes

- dc189bf: Respect that we're trying to tolower the repo owner name inside the tags filed of the docker/build-push-action not a shell script lol

## 0.0.2

### Patch Changes

- 506146d: use all lower case repo owner for ghcr

## 0.0.1

### Patch Changes

- cac11b7: Add a ci.yml to handle building and testing containers on PR pushes
- 1acdac8: Install, init, and start using changesets
- cac11b7: Add a release and publish workflow for github actions
