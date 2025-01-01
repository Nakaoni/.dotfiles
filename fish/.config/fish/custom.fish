if status is-interactive
    # Commands to run in interactive sessions can go here
    # VARIABLES
    set -U EDITOR vim
    set -gx fish_prompt_pwd_dir_length 0

    # FUNCTIONS
    ## LS COMMANDS
    function ll
        ls -alF $argv
    end

    ## GIT COMMANDS
    function gits
        git status $argv
    end

    function gitc
        git checkout $argv
    end

    function gitl
        git log $argv
    end

    function gitfp
        git fetch origin && git pull $argv
    end

    function gitc2ane
        git commit -a --amend --no-edit $argv
    end

    function gitpoh
        git push origin HEAD $argv
    end
end
