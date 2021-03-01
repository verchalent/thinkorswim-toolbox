# thinkorswim-toolbox
Toolbox container for running Thinkorswim on a SELinux based system with GUI.

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


