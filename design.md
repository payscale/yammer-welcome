Initial Design of the Yammer Welcome Screen
===========================================

This is my initial notes on the design of the "welcome screen" based on polled data from the company's Yammer network

Object Model
------------

 * Company
  * Name
  * Yammer Network
  * Users (many)
   * Yammer Auth
  * Profiles (many)
   * Name
   * Picture URL
   * Biography
   * Interests

Areas to tackle
---------------
There seem to be two major components, and one minor
 1. Welcome screen
  * Link to - updater (requires auth)
  * Link to - displayer (requires auth)
  * Link to authenticate against Yammer OAuth
 1. Updater
  * Require Auth
  * Fetch all profiles in network
  * Deposit into db
  * (Inactivate deleted profiles)
 1. Displayer
  * Require Auth
  * Display profile information
  * Rotate between profiles 
 1. Doing the Oauth stuff (with OmniAuth)
 1. Getting rpi to boot into xwin with a full screen browser, set to a specific url
