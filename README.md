# caramel
mOS (distro-agnostic) additional Bundles

Caramel contains definitions for `mOS` portable apps, which definitions is in Dockerfiles that you can find here.

You can find each bundle dockerfile in the respective directory.

Binaries ready to be downloaded and run can be found in the [releases](https://github.com/mocaccinoOS/caramel/releases)

## Create a new bundle

Creating a new bundle is extremely simple. In fact bundles are just standard container definitions. 

1) Create a new folder named after your bundle in the top level of the git repository with a Dockerfile. The Dockerfile should bring all the dependencies required in order to run your app
2) Add a new block in the matrix inside the workflow file `.github/workflows/images.yaml`. See the other bundles as examples, but it boils down to define a tag and a dockerfile (the location where the Dockerfile is)

```yaml
- tag: "gimp"
  dockerfile: "gimp"
  bundler_opts: "--entrypoint /usr/bin/gimp --app-store '$HOME/.mos-app/gimp' --app-mounts /dev --app-mounts /home --app-mounts /sys --app-mounts /tmp --app-mounts /run"
```