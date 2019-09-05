require 'sinatra/bundler'

ENV['SINATRA_ENV'] ||= 'development'

Bundler.require :default, ENV['SINATRA_ENV']

require_all './app'
