# Minimal Docker image to explain Docker from the beginning

The smallest possible Docker image contains a Hello World application that avoids libc so has 0 dependencies and uses less than 9kB.

> Take a look at [linux syscall](https://github.com/raminfp/linux_syscall/blob/master/C_syscall_without_standard_library_linux/assm_syscall.c) for a Hello World without libc.

You can create the image with `docker build -t minimal .`

## More examples

The `Dockerfile.compiler` creates the same minimal image, but uses a multibuild stage to compile the C program using gcc. Build this one with `docker build -t minimal -f Dockerfile.compiler .`.	

To be able to see what's into the image, you need some more basic libraries and tools. These are provided with the `Dockerfile.sh` one, where we provide a bin folder with the `sh` executable, and the lib and lib64 folders with the libc libraries needed for sh.

Create the image with `docker build -t minsh -f Dockerfile.sh .`, and run it with `docker run -it minsh sh`.

## Navigating the Linux shell without any tool

With the last image, there's only the sh and hello executables. But you can still do some basic things with the shell:

* `cd` to change the current directory
* `echo *` to list the files in the current directory
* `pwd` to show the current directory
* You can create a cat command with this shell function:
    ```sh
    cat() {
    while read line;
        do echo $line
    done < $1
    }
    ```
* Now you can do `cat /proc/version` to see the kernel version