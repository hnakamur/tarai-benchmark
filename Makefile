SHOW_RSS = 2>&1 /usr/bin/time -f %M

run-all-3-times:
	seq 1 3 | xargs -I {} $(MAKE) run-all

run-all: tarai_O3 run-c run-luajit run-node run-ruby-yjit run-sbcl

run-c: tarai_O3
	$(SHOW_RSS) ./tarai_O3

tarai_O3: tarai.c
	gcc -O3 tarai.c -o tarai_O3

run-luajit:
	$(SHOW_RSS) luajit tarai-ffi-time.lua

run-node:
	$(SHOW_RSS) node tarai.js

run-ruby-yjit:
	$(SHOW_RSS) ruby --yjit tarai.rb

run-sbcl:
	$(SHOW_RSS) sbcl --script tarai-g1.lisp

clean:
	@rm -f tarai_O3
