FROM scratch

COPY /source/hello /usr/bin/hello

CMD ["hello"]