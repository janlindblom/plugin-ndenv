function __fish_ndenv_using_command
  set cmd (commandline -opc)
  set subcommands $argv
  if [ (count $cmd) = (math (count $subcommands) + 1) ]
    for i in (seq (count $subcommands))
      if not test $subcommands[$i] = $cmd[(math $i + 1)]
        return 1
      end
    end
    return 0
  end
  return 1
end

# Find installed versions by looking in the file system
function __fish_ndenv_installed_versions
  ls (ndenv root)/versions | sort
end

# Find available versions to install. Requires the node-build plugin
function __fish_ndenv_install_available_versions
  ndenv install -l | grep "v[0-9]" | sed 's/^\ *//g' | sort
end

# Base commands
complete -f -c ndenv -a commands -d "List all available ndenv commands"
complete -f -c ndenv -a local     -d "Set or show the local application-specific Node version"
complete -f -c ndenv -n '__fish_ndenv_using_command local' -a '(__fish_ndenv_installed_versions)' -d "Set or show the local directory-specific Node version"
complete -f -c ndenv -a global    -d "Set or show the global Node version"
complete -f -c ndenv -n '__fish_ndenv_using_command global' -a '(__fish_ndenv_installed_versions)' -d "Set or show the global Node version"
complete -f -c ndenv -a shell     -d "Set or show the shell-specific Node version"
complete -f -c ndenv -a rehash    -d "Rehash ndenv shims (run this after installing executables)"
complete -f -c ndenv -a version   -d "Show the current Node version and its origin"
complete -f -c ndenv -a versions  -d "List all Node versions available to ndenv"
complete -f -c ndenv -a which     -d "Display the full path to an executable"
complete -f -c ndenv -a whence    -d "List all Node versions that contain the given executable"

# For the node-build plugin
complete -f -c ndenv -a install   -d "Install a Node version using the node-build plugin"
complete -f -c ndenv -n '__fish_ndenv_using_command install' -s l -l list -d "List all available versions"
complete -f -c ndenv -n '__fish_ndenv_using_command install' -s f -l force -d "Install even if the version appears to be installed already"
complete -f -c ndenv -n '__fish_ndenv_using_command install' -s k -l keep -d "Keep source tree in $NDENV_BUILD_ROOT after installation"
complete -f -c ndenv -n '__fish_ndenv_using_command install' -s v -l verbose -d "Verbose mode: print compilation status to stdout"
complete -f -c ndenv -n '__fish_ndenv_using_command install' -a '(__fish_ndenv_install_available_versions)' -d "Install a Node version using the node-build plugin"
complete -f -c ndenv -a uninstall -d "Uninstall a specific Node version"
complete -f -c ndenv -n '__fish_ndenv_using_command uninstall' -s f -d "Attempt to remove the specified version without prompting for confirmation."
complete -f -c ndenv -n '__fish_ndenv_using_command uninstall' -a '(__fish_ndenv_installed_versions)' -d "Uninstall a specific Node version"
