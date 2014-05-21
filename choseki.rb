# -*- coding: utf-8 -*-
require 'rexml/document'
require 'open-uri'
require 'nkf'
require 'net/http'
require 'uri'

class Choseki

 @@baseurl = 'http://www.e-tsuri.info/tide?'

 def initialize

 end
 
 def request(p,d)
  url = @@baseurl + "p=#{p}" + "&d=#{d}"
  uri = URI.escape(url)
  parse_url = URI.parse(uri)
  result = open(parse_url)  
  doc = REXML::Document.new(result)
  return doc
 end

end

choseki = Choseki.new()

doc = choseki.request("芝浦","2014/05/22")
doc.elements['ResultSet'].each{
  |element|  
  element = element.to_s.gsub(/<port_name>(.+)<\/port_name>/,'\1')
  element = element.to_s.gsub(/<lat>(.+)<\/lat>/,'\1')
  element = element.to_s.gsub(/<lng>(.+)<\/lng>/,'\1')
  element = element.to_s.gsub(/<year>(.+)<\/year>/,'\1')
  element = element.to_s.gsub(/<month>(.+)<\/month>/,'\1')
  element = element.to_s.gsub(/<day>(.+)<\/day>/,'\1')
  element = element.to_s.gsub(/<youbi>(.+)<\/youbi>/,'\1')
  element = element.to_s.gsub(/<shiomei>(.+)<\/shiomei>/,'\1')
  element = element.to_s.gsub(/<getsurei>(.+)<\/getsurei>/,'\1')
  element = element.to_s.gsub(/<hinode>(.+)<\/hinode>/,'\1')
  element = element.to_s.gsub(/<hinoiri>(.+)<\/hinoiri>/,'\1')
  element = element.to_s.gsub(/<tsukinode>(.+)<\/tsukinode>/,'\1')
  element = element.to_s.gsub(/<tsukinoiri>(.+)<\/tsukinoiri>/,'\1')
  element = element.to_s.gsub(/<tide>(.+)/,'\1')
  element = element.to_s.gsub(/<\/tide>/,'\1')
  puts element
}


