# RC2014

## Set this repo to CRLF line endings for CPM

```sh
git config core.eol crlf
git config core.autocrlf input
```

## Run the Docker container with Assemblers

This project is setup to be run in a Visual Studio Code Dev Container. If you
prefer, you can manually rum the docker container.

```sh
docker run --rm -v ${PWD}:/src -w /src -it rprouse/asm-dev
```

### Compile using SjASMPlus

Compile a single file at the command line,

```sh
sjasmplus lcdtest.asm --lst --color=on --inc=./include --raw=lcdtest.com
```

### Compile using RASM

Compile a single file at the command line,

```sh
rasm lcdtest.asm -ob lcdtest.com
```

## RC2014 Compact Flash

There are two caveats to be aware of if you are operating on a CF card directly:

1. You must run your command prompt as administrator.
2. You need to find out which disk you will be using. You can find out by doing any of the following:
    - Go into the computer management console, then Storage->Disk Management.  Note the number of your disk.
    - In your administrator prompt, run "diskpart", then at the dispkart prompt, type: "list disks".  Note the number of your disk.

Once you get your information, then you specify the image as "\\.\PhysicalDrive(X)" where (X) is your disk

Mount the Compact Flash as the Z drive. In an admin command prompt from the `bin`
directory, run the following adjusting the last letter of rc2014x for the drive;

```sh
.\cpmcbfs.exe -f rc2014h -i \\.\PhysicalDrive3
```

To copy the content of the compact flash card to a file,

```sh
dd if=\\.\PhysicalDrive3 of=RC21014.img
```

The image consists of a concatenation of 15 8Mb disk images (A: through O:) and one 2Mb disk image. I used dd to extract the individual images, e.g. for drive C

```sh
dd if=RC2014.img of=disk_C bs=1M skip=16 count=8
```

## Software

- [cpmtools for Windows](http://www.cpm8680.com/cpmtools/)
- [dd for Windows](http://www.chrysocome.net/downloads/dd-0.6beta3.zip)
- [cpmcbfs for Windows](http://www.nyangau.org/cpmcbfs/cpmcbfs.htm)
- [Win32 Image Writer](https://sourceforge.net/projects/win32diskimager/)