# coding: utf-8

require 'active_resource'


class PowerdnsHttpApi::Resource < ActiveResource::Base

  module ClassMethods

    def fixed_values(hash)
      hash.each do |key, value|
        const_set key.to_s.camelcase, value

        [value].flatten.compact.each do |value|
          meth_name = "#{value.downcase.tr('-', '_')}?"
          define_method(meth_name) { value == self.send(key) }
        end

        validates key, inclusion: {in: value}
      end
    end

  end


  ##
  # Classes that inherit from this object get the essential details set:
  # * PowerDNS-API url 
  # * HTTP header field for the API key
  # * disables format extension for resources

  def self.inherited(subclass)
    subclass.site = Config.base_url
    subclass.headers['X-API-Key'] = Config.fetch(:api, :key)
    subclass.include_format_in_path = false
    subclass.element_name = subclass.element_name.pluralize

    subclass.extend ClassMethods
  end


  ##
  # Attributes hash hash value in decimal notation.
  #
  # @return [Fixnum]

  def hash
    attributes.hash
  end


  ##
  # Attributes hash hash value in haxadecimal notation.
  #
  # @return [String]

  def hexhash
    hash.to_s(16)
  end


  ##
  # return [String]

  def inspect
    attrs = attributes.map { |k, v| "#{k}: #{v.inspect}" }
    "#<#{self.class} #{attrs.join(', ')}>"
  end

end

