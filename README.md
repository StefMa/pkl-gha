# pkl-gha

A [Pkl](https://pkl-lang.org/) template for writing a GitHub Action workflow.

## What?

## How?

## Why?

## Example

## Releasing

**Step 1**: Make sure you're on the `main` branch and pull the latest changes.
```bash
git checkout main
git pull origin main
```
**Step 2**: Create a git tag in form of `com.github.action@[SEMVER_VERSION]`.
```bash
git tag com.github.action@[SEMVER_VERSION]
```
**Step 3**: Push the tag to the remote repository.
```bash
git push origin com.github.action@[SEMVER_VERSION]
```
**Step 4**: The tag creates a new release on GitHub. 
Go to the [releases](http://github.com/StefMa/pkl-gha/releases) page and edit the new release.
Put some information about the changes in the description and publish the release.

**Step 5**: Update `SNAPSHOT` version in [PklProject](PklProject) to the next version and push the changes.
```bash
git add PklProject
git commit -m "Bump snapshot version"
git push origin main
```
