# SYNOPSIS
#   ndenv [options]
#

function init --on-event init_ndenv
  if not available ndenv
    echo "Please install 'ndenv' first!"; return 1
  end
  if status --is-interactive
    if ndenv init - | grep --quiet "function"
      source (ndenv init - | psub)
    else

      if not set -q NDENV_ROOT
        set -x NDENV_ROOT "$HOME/.rbenv"
      end

      set PATH "$NDENV_ROOT/shims" $PATH

      function ndenv -d "node.js/io.js version manager"
        set command $argv[1]
        set -e argv[1]
        switch "$command"
          case rehash shell
            eval (ndenv "sh-$command" $argv)
          case '*'
            command ndenv "$command" $argv
        end
      end
    end
  end
end

