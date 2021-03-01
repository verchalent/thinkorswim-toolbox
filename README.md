# thinkorswim-toolbox
Toolbox container for running Thinkorswim on a SELinux based system with GUI.

Dockerfile adapted from https://github.com/containers/toolbox/blob/e27d7cafa45303100db91797179ecec1c4abb9a3/images/debian/unstable/Dockerfile

## Install
Create Docker Image
```
podman build -t thinkorswim .
```

Build Toolbox
```
toolbox create --container thinkorswim-toolbox --image localhost/thinkorswim
```

Enter
```
toolbox enter thinkorswim-toolbox
```
Once the container launches for the first time, you can download the TOS installer and run normally.


