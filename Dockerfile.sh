FROM gcc AS compiler
WORKDIR /source
COPY /source/*.c /source/*.S .
RUN gcc -s -O2 -nostdlib stubstart.S -o hello hello.c
RUN chmod +x hello

FROM scratch

# adds the basic libc libraries and the sh command
COPY /target /
COPY --from=compiler /source/hello /usr/bin/

CMD ["hello"]