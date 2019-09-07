require 'bundler/setup'
require 'sinatra/base'
# require './secretz.rb'
require './eb_info.rb'

ENV['SINATRA_ENV'] ||= 'development'
# ENV['TICKETMASTER-API-KEY'] = SECRET_TICKETMASTER
ENV['EVENTBRITE-API-KEY'] = SECRET_EVENTBRITE

Bundler.require :default, ENV['SINATRA_ENV']



require_all './app'
