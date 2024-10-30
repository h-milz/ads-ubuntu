# Running Keysight ADS2025 on Ubuntu 24.04 LTS

Although Keysight does not officially support ADS on Ubuntu (only [RHEL and SLES](https://docs.keysight.com/display/support/ADS%20Supported%20Platforms)), it is fairly easy to install and run ADS2025 on Ubuntu 24.04. 

Most steps are explained on the [Quick Install](https://docs.keysight.com/display/engdocads/ADS+2025+Quick+Install-Linux) page. The following tutorial assumes you downloaded the ADS installer and obtained a valid node locked license file for your machine.  

The installer is Java based and should run fine on either platform because it brings its own JVM. 

Additional steps for Ubuntu 24.04: 

1. One requirement for the license manager is "Linux Standard Base (LSB)", meaning that some binaries are linked against `/lib64/ld-lsb-x86-64.so.3` which by default is not available on Ubuntu 24.04. In earlier Ubuntu versions, this shared library was provided by the `lsb-core`  package but the Ubuntu maintainers decided to drop this package for 24.04. Whatever. However, it is easy to work around this pitfall by symlinking `ld-linux-x86-64.so.2`. As root, do: 

    `# cd /lib64 && ln -s ld-linux-x86-64.so.2 ld-lsb-x86-64.so.3`

2. Some binaries use `libxcb-ewmh2`, and most of the provided shell scripts are written for Korn shell. Bash won't work due to some ksh'isms. Consequently, 

    `# apt install libxcb-ewmh2 ksh`

3. Finally, create the default installation directory. You can choose any other directory to your liking but you will need to tell the installer in the following step. 

    `# mkdir /usr/local/ADS2025 && chown $USER:$USER /usr/local/ADS2025`

4. Then, as $USER, untar the ADS tar archive into a temporary directory and `cd` into that directory. Next, run the installer: 

    `$ ./SETUP.SH`

5. As root, a final step: 

    `# chown -R root:root /usr/local/ADS2025` 

Done. You can also run `SETUP.SH` as root, but then you may be defaulted to the text-based installer because root may not have access to the graphical desktop. In any case, you can delete the temporary directory when finished. 

Next, copy `ads_start.sh` to a directory in your `PATH`, e.g. `$HOME/bin`, set executable permissions, and edit the shell variables at the top to reflect your installation choices. 

Last, copy `ads.desktop` to `$HOME/.local/share/applications` to create the menu entry for GNOME. Again, edit the file to adjust the `Exec` and `Icon` paths as required. 

That's it. You should now be able to start ADS from your application menu. The program start takes a few moments so be patient. 

## What works

I tested a few functions that I currently work with: 

* Schematic
* LineCalc
* Layout
* Simulate

and all appear to work fine. 

## ADS Updates

In case you want to update ADS to a newer version, all that should be required is installing into the existing directory as demonstrated (i.e., steps #3-#5). 

## Support

Please note that I can give no support whatsoever for Keysight ADS. In case of questions please contact Keysight support. They will not answer questions concerning Ubuntu 24.04 though - in this specific case feel free to ask.  Please note that I have no access to any other ADS version, and I have tested the steps above only on Ubuntu 24.04 so please do not ask for any other version combination. 

## Copyright and Licensing

The material in this git repository is copyrighted by me and licensed to you by the [GNU General Public License V3](https://www.gnu.org/licenses/gpl-3.0.en.html). Commercial use without written permission is strictly forbidden. If you are interested, feel free to ask for a commercial license. 



