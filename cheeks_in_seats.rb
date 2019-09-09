require 'bundler/setup'
require 'sinatra/base'
require './secretz.rb'
require "rubygems"
require "bundler"
require './app/services/eventbrite_service.rb'

Bundler.require(:default)
Bundler.require(Sinatra::Base.environment)
require 'active_support/deprecation'
require 'active_support/all'


ENV['SINATRA_ENV'] ||= 'development'
ENV['TICKETMASTER-API-KEY'] = SECRET_TICKETMASTER
ENV['EVENTBRITE-API-KEY'] = SECRET_EVENTBRITE

Bundler.require :default, ENV['SINATRA_ENV']

require_all './app'
