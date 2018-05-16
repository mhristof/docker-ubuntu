#
#


default: build


build:
	docker build -t mhristof/ubuntu .

push: build
	docker push mhristof/ubuntu


# vim:ft=make
#
