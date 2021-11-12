FROM gcc AS compiler
WORKDIR /source
COPY source .
RUN gcc -s -O2 -nostdlib stubstart.S -o hello hello.c
RUN chmod +x hello

FROM scratch
COPY --from=compiler /source/hello ./

CMD ["./hello"]