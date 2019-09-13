ENV['SINATRA_ACTIVESUPPORT_WARNING'] = 'false'
require 'bundler/setup'
require 'sinatra/base'
require './secretz.rb'
require 'rubygems'

Bundler.require(:default)
Bundler.require(Sinatra::Base.environment)

ENV['SINATRA_ENV'] ||= 'development'
ENV['REDIS_URL'] ||= 'redis://localhost:6379/0'
ENV['TICKETMASTER-API-KEY'] = SECRET_TICKETMASTER
ENV['EVENTBRITE-API-KEY'] = SECRET_EVENTBRITE 

Bundler.require :default, ENV['SINATRA_ENV']

require_all './app'
