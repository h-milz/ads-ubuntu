# Running Keysight ADS2025 on Ubuntu 24.04 LTS

Although Keysight does not officially support ADS on Ubuntu (only [RHEL and SLES](https://docs.keysight.com/display/support/ADS%20Supported%20Platforms)), it is faily easy to install and run ADS2025 on Ubuntu 24.04. 

Most steps are explained on the [Quick Install](https://docs.keysight.com/display/engdocads/ADS+2025+Quick+Install-Linux) page. Installing uses a Java-based installer which appears to run fine on either platform because it brings its own JVM. 

Additional steps for Ubuntu 24.04: 

* One requirement for the license manager is "Linux Standard Base (LSB)", meaning that some binaries are linked against `/lib64/ld-lsb-x86-64.so.3` which by default is not available on Ubuntu 24.04. In earlier Ubuntu versions, this shared library was provided by the `lsb-core`  package but the Ubuntu maintainers decided to drop this package for 24.04. Whatever. However, it is easy to build a workaround by symlinking `ld-linux-x86-64.so.2`:

    `# cd /lib64 && ln -s ld-linux-x86-64.so.2 ld-lsb-x86-64.so.3`

* some binaries use `libxcb-ewmh2`, and most of the provided shell scripts are written for Korm shell. Bash won't work due to some ksh'isms. Consequently, 

    `# apt install libxcb-ewmh2 ksh`

* Finally, create the default installation directory, like

    `# mkdir /usr/local/ADS2025 && chown $USER:$USER /usr/local/ADS2025`








## Support

Please note that I can give no support whatsoever for Keysight ADS. In case of questions please contact Keysight support. They will not answer questions concerning Ubuntu 24.04 though - in this specific case feel free to ask.  Please mind that I have no access to any other ADS version, and I have tested the steps above only on Ubuntu 24.04 so please do not ask if any other version is involved. 