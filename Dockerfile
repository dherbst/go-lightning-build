FROM buildpack-deps:jessie-scm
ADD bin/lightning /usr/local/bin/lightning
ENTRYPOINT ["lightning"]
