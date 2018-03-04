# Rails Starter

A rails starter template using Slim, Devise, Bootstrap 3.2, docker, and cucumber.

## Dev setup
- setup heroku:
- Using brew: `brew install heroku/brew/heroku`
- copy `env.sample` to `.env` and add your hostname
- Install Docker
- first time: Run `docker-compose build` to build it
- When you change the gemfile, you'll need to re-run the above.
- Run `docker-compose up` to start rails
- To run cucumber tests, etc, run `docker-compose run web bash` for an interactive bash shell
- Run `rake db:setup`
- Seed the "statuses" via `rake statuses:seed`
- To shut down gracefully, in another terminal window, run `docker-compose down`

## Adding demo data
You might wish to add a bunch of users, projects, etc. you can do this by running: `rake my_fixtures:all` from inside a docker bash session (`docker-compose run web bash`)

## Mail testing
To test emails in development, I recommend using (mailcatcher)[https://mailcatcher.me] which caches and displays emails sent by your app. You can run in via a docker container like so: `docker run -it -p 1080:80 -p 25:25 tophfr/mailcatcher`. Using the `-it` switches will keep the virtual terminal open & connected so you can see if mails are routing correctly through the container. The `config/environments/develoment.rb` file should already be set up to relay mails through the host in your local environment.

## Troublshooting:
- If you get a message that a server is already running (because you didn't gracefully shut down) just log into the machine `docker-compose run web bash` and `rm /tmp/pids/server.pids`
- If you're using Heroku behind a proxy, you might not be able to run things like `heroku run bash` since it uses a TCP socket (not HTTP) So you'll need to connect via an open network


#deploy to production
- Use heroku
- Set the "host" env variable
- `heroku run rake db:migrate --app <APPNAME>`
- You should now be up and running

#TODOs
- allow email allowable domains and return addresses to be configured via env vars

#testing
Use cucumber...
To test WIP tests in dev run `rake cucumber:wip`
To run all tests: `rake cucumber:wip`
