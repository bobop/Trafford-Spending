# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_traffordspending_session',
  :secret      => 'c3dbed75ac047de3c5db4c73a5884585b9cf998f7a7c1635c5d24672340de6f0794df3dfd0f3db7531d50f5a0af489cef63842a41ecfa5d63f410c8b9d0fbcbc'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
