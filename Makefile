.PHONY: build
build:
	which gem || gem install bundler
	bundle install

.PHONY: test
test:
	bundle exec rspec
