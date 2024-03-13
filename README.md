![GitHub Release](https://img.shields.io/github/v/release/stefma/pkl-gha?include_prereleases)

# pkl-gha

A [Pkl](https://pkl-lang.org/) template for writing a GitHub Action workflow.

## What?

[Pkl](https://pkl-lang.org/) is a configuration as code language with rich validation.
Yaml, the language used for GitHub Actions on the other hand, is a configuration language with **no validation** at all.
We have to rely on third-party tools or IDE support to validate our GitHub Actions.
While this will get better over time, it's still not as good as having a language with rich validation out of the box.

This is where this template comes in.
It allows you to write your GitHub Actions in Pkl and then compile them (using the Pkl cli) to Yaml.
The generated Yaml output, if successfully converted, is definitely Yaml validated and ready to be used in your GitHub
Actions.

## How?

**1. Write a Pkl file and `amend` this template**

```
amends "package://pkg.pkl-lang.org/github.com/stefma/pkl-gha/com.github.action@[LATEST_VERSION]#/GitHubAction.pkl"

name = "Test"

on {
  // Define your `on` triggers. E.g.:
  push {
    branches {
      "main"
      }
  }
  pull_request {}
}

jobs {
  // Define your `jobs`. E.g.: 
  ["test"] {
    `runs-on` = new UbuntuLatest {} // Could also be a string like "ubuntu-latest"
    // Define your `steps`. E.g.:
    steps {
      new {
        name = "Checkout"
        uses = "actions/checkout@v4"
        with {
          ["fetch-depth"] = 0
        }
      }
      new {
        name = "Setup nexus credentials"
        run = """
          mkdir ~/.gradle
          echo "systemProp.nexusUsername=${{ secrets.NEXUS_USERNAME }}" >> ~/.gradle/gradle.properties
          echo "systemProp.nexusPassword=${{ secrets.NEXUS_PASSWORD }}" >> ~/.gradle/gradle.properties
        """
      }
      new {
        name = "Test android app"
        run = "./gradlew testDebugUnitTest"
      }
    }
  }
}
```

**2. Install the Pkl cli**

```bash
brew install pkl
````

**3. Convert the Pkl file to Yaml**

```bash
pkl eval path/to/your/pkl/file.pkl -o path/to/your/pkl/file.yaml
```

## Why?

* **Strong typing**: Pkl is a strongly typed language. This means that you can't accidentally use a wrong type in your
  configuration.
* **Simplicity**: Strong validation and strong typing but still simple to write.

## Examples

You can find real-life examples in the [.github/workflows](.github/workflows) directory of this repository.
There are some examples in the [examples](examples) directory.

The (right now) supported templates looks like that:
```
name: String
on: On
env: EnvironmentVariables?
concurrency: Concurrency?
permissions: (*Permissions|"read-all"|"write-all")?
jobs: Mapping<String, Job>
```

The template itself as well as the `class` definitions can be found in the [GitHubAction.pkl](GitHubAction.pkl) file.

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
