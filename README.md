# pkl-gha

A [Pkl](https://pkl-lang.org/) template for writing a GitHub Action workflow.

## What?

## How?

## Why?

## Example

## Releasing

**Step 1**: Make sure you're on the `main` branch and pull the latest changes.
```
git checkout main
git pull origin main
```
**Step 2**: Create a git tag in form of `com.github.action@[SEMVER_VERSION]`.
```
git tag com.github.action@[SEMVER_VERSION]
```
**Step 3**: Push the tag to the remote repository.
```
git push origin com.github.action@[SEMVER_VERSION]
```
**Step 4**: The tag creates a new release on GitHub. 
Go to the [releases](github.com/stefma/pkl-gha/releases) page and edit the new release.
Put some information about the changes in the description and publish the release.