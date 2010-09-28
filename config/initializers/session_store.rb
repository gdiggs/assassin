# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_assassin_session',
  :secret      => '983cf2769620cd19a1ddf6b8aafcab03b4aca3bb96118c0a0fc6cce435996c0ad5a70b994f40c062ddc8c3eb6c5bb513b8aff0515fcbafc3ea8fa62fb0b65802'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
