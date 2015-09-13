complete -f -c ndenv -a commands -d "List all available ndenv commands"
complete -f -c ndenv -a local     -d "Set or show the local application-specific Node version"
complete -f -c ndenv -a global    -d "Set or show the global Node version"
complete -f -c ndenv -a shell     -d "Set or show the shell-specific Node version"
complete -f -c ndenv -a install   -d "Install a Node version using the node-build plugin"
complete -f -c ndenv -a uninstall -d "Uninstall a specific Node version"
complete -f -c ndenv -a rehash    -d "Rehash ndenv shims (run this after installing executables)"
complete -f -c ndenv -a version   -d "Show the current Node version and its origin"
complete -f -c ndenv -a versions  -d "List all Node versions available to ndenv"
complete -f -c ndenv -a which     -d "Display the full path to an executable"
complete -f -c ndenv -a whence    -d "List all Node versions that contain the given executable"