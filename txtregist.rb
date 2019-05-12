#!/usr/bin/env ruby
# coding: utf-8

require 'yaml'
require 'uri'
require 'net/http'
require 'base64'

MYDNSJP_URL  = "https://www.mydns.jp/directedit.html"
MYDNSJP_CMD  = "REGIST"

# Prepare https session
uri = URI.parse(MYDNSJP_URL)
https = Net::HTTP.new(uri.host, uri.port)
https.use_ssl = true

# Read credential information
conf = YAML::load(File.open(File.join(__dir__, "conf.yaml")))

# Create HTTP Request
req = Net::HTTP::Post.new(uri.request_uri)

# Prepare request headers
req["Content-Type"]  = "application/x-www-form-urlencoded"
req["Authorization"] = "Basic " + Base64.strict_encode64(conf['MYDNSJP_MASTERID'] + ":" + conf['MYDNSJP_MASTERPWD'])

# Prepare request body
payload = {
	"CERTBOT_VALIDATION": ENV['CERTBOT_VALIDATION'],
	"CERTBOT_DOMAIN": ENV['CERTBOT_DOMAIN'],
	"EDIT_CMD": MYDNSJP_CMD
}
req.body = URI.encode_www_form(payload)

# Fire request
res = https.request(req)

# Check the results - for debug
#puts res
