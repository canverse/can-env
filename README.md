# Installation

## Windows
 **Most of this section has been cobbled together from two [extremely][zwsh-dfontana] [helpful][zwsh-edqu3] articles.**

 The get this whole setup to work on Windows, we will be using several tools, 
 `Cmder`, `CygWin` and `Mintty`. I decide to call this `zwsh`.
 
 First we need to set some things up manually before we can move on to calling `scripts/setup.sh`
 1) Download and install [cygwin](https://cygwin.com/install.html).
    * Make sure that you search for and check `wget`.
    * Run the following to install [apt-cyg](https://github.com/transcode-open/apt-cyg)
        ```shell script
        wget rawgit.com/transcode-open/apt-cyg/master/apt-cyg
        install apt-cyg /bin
        apt-cyg install zsh git gdb dos2unix openssh vim
        ```
    * (Optional) If you want `zwsh` to use the Windows `home` you need to add `db_home: windows` at the end of `/etc/nsswitch.conf`. (I choose to leave this enabled because I intend to share some of these configurations to `cmd`. (maybe there is a better way of doing it?)
    
    We're done with `cygwin` for now. 
    
 2) Download [cmder](https://cmder.net/). Get the Full version!
    
    You can put the folder anywhere you like. I use `C:\Program Files\cmder`. 
    
    Make sure that you're in the same folder where you cloned the `canverse/can-env` repository and from a `Powershell` execute the following command:
    ```powershell
        ./install-fonts.ps1
    ```
    You will be asked to run the script as an administrator if you aren't already. This is normal. 
    
  3)
    
     
     
[zwsh-dfontana]: https://gist.github.com/dfontana/3e27ec5ea3a6f935b7322b580d3df318
[zwsh-edqu3]: https://github.com/edqu3/zsh-cygwin-conemu