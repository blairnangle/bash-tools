# bash-tools

### Getting started
The below instructions assume you are using a Unix environment with some sort of shell (bash, zsh, etc.)

* Clone this project into your parent project directory and rename occurrences of `<PROJECT>`, etc. accordingly 
* Create a file: `~/.<PROJECT>_profile`
* Add the following code to `<PROJECT>_profile`,
```bash
meta_function() {
    (cd /Users/<USERNAME>/<PROJECT>/bash-tools && ./meta_function "$@")
}

alias meta=meta_function;
```
* Add the following line to the top of your `.zshrc` or `.bash_profile` file (you can find out which one is appropriate by running `echo $SHELL`),
```bash
source /Users/<USERNAME>/.<PROJECT>_profile
```
* _Source_ your relevant profile, e.g. `source ~/.zshrc`, or just quit your shell application and reopen it to feel the benefit of your changes
* You should now be able to run `meta help` from any directory to see a list of possible commands
