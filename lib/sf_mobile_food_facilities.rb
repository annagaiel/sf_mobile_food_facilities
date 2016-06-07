require "sf_mobile_food_facilities/version"
require 'unirest'
require 'pry'

module SfMobileFoodFacilities
  class Facility
    attr_reader :address, :applicant, :approved,
      :block, :blocklot, :cnn, :dayshours,
      :expirationdate, :facilitytype, :fooditems,
      :latitude, :location, :locationdescription,
      :longitude, :lot, :objectid, :permit,
      :priorpermit, :received, :schedule,
      :status, :x, :y

    def initialize(hash)
      @address = hash["address"]
      @applicant = hash["applicant"]
      @approved = hash["applicant"]
      @block = hash["block"]
      @cnn = hash["cnn"]
      @dayshours = hash["dayshours"]
      @expirationdate = hash["expirationdate"]
      @facilitytype = hash["facilitytype"]
      @fooditems = hash["fooditems"]
      @latitude = hash["latitude"]
      @location = hash["location"]
      @locationdescription = hash["locationdescription"]
      @longitude = hash["longitude"]
      @lot = hash["lot"]
      @objectid = hash["objectid"]
      @permit = hash["permit"]
      @priorpermit = hash["priorpermit"]
      @received = hash["received"]
      @schedule = hash["schedule"]
      @status = hash["status"]
      @x = hash["x"]
      @y = hash["y"]
    end

    def self.all
      facilities_array = Unirest.get("https://data.sfgov.org/resource/6a9r-agq8.json").body
      facilities = []
      facilities_array.each do |facility_hash|
          facilities << Facility.new(facility_hash)
      end
      return facilities
    end

    def self.first
      facilities_array = Unirest.get("https://data.sfgov.org/resource/6a9r-agq8.json").body
      return facilities_array[0]
    end

    def self.last
      facilities_array = Unirest.get("https://data.sfgov.org/resource/6a9r-agq8.json").body
      return facilities_array[-1]
    end

    def self.where(hash)
      domain = "https://data.sfgov.org/resource/6a9r-agq8.json?"
      hash.each_with_index do |(key,value), index|
        domain += "#{key}=#{value}"
        if hash.size-1 > index
          domain += "&"
        end
      end
      domain.gsub!(' ', '%20')
      facilities_array = Unirest.get("#{domain}").body
      return facilities_array
    end

    def self.find_by(field_name, field_param)
      facilities_array = Unirest.get("https://data.sfgov.org/resource/6a9r-agq8.json?#{field_name}=#{field_param}").body
      return facilities_array[0]
    end
  end
end
