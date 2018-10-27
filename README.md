# Courier Bot

Courier Bot is a simple SMS reporting proof-of-concept. This application is the result of observations made by reading about projects used in humanitarian aid and disaster relief over the past years (projects such as [FrontlineSMS](https://www.frontlinesms.com/), [Ushahidi](https://www.ushahidi.com/), [Needslist](https://needslist.co/)...).

This project was built using Rails 5. It's using the TwilioSMS API and websockets through Rails 5 ActionCable. It also uses Devise for authentication, Bootstrap 4, and Redis.

## Development
```
git clone git@github.com:etiennebaque/courierbot.git
cd courierbot && bundle install
rails db:setup
rails s # App can be reached at http://localhost:3000
```

## Third-party services
2 more things before you get started
- (development only) Install [Ngrok](https://ngrok.com/) and run `./ngrok http 3000` to make your Rails app accessible publicly, via a secure tunnel.
- You need to sign up to [Twilio](https://www.twilio.com). 
-- Once you got access to the Twilio console, get a [new phone number for incoming messages](https://www.twilio.com/console/phone-numbers/incoming).
-- If you're using Twilio in dev, enter your ngrok url in the Messaging section of your Twilio phone number page.
-- You will then have to set up these three environment variables locally, with values from your Twilio console, so that you can send text messages to your app:
  ```
  export TWILIO_ACCOUNT_SID=""
  export TWILIO_AUTH_TOKEN=""
  export TWILIO_PHONE_NUMBER=""
  ```
