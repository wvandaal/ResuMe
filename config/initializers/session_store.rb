# Be sure to restart your server when you modify this file.

# Note that the domain has been specified to allow for session
# sharing across subdomains
Vandaalen::Application.config.session_store :cookie_store, key: '_vandaalen_session', :domain => :all, :tld_length => 2

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Vandaalen::Application.config.session_store :active_record_store
