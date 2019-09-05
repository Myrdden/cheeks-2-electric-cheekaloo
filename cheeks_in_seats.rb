require 'bundler/setup'
require 'sinatra/base'
require './secretz.rb'

ENV['SINATRA_ENV'] ||= 'development'
ENV['TICKETMASTER-API-KEY'] = SECRET_TICKETMASTER

Bundler.require :default, ENV['SINATRA_ENV']



require_all './app'
