setup:
	gem install bundler
	bundle install

serve:
	bundle exec jekyll serve --baseurl ''

build:
	bundle exec jekyll build -d ../doujin-site-gh-pages/

update:
	sudo bundle update
