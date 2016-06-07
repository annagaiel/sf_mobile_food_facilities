require "sf_mobile_food_facilities/version"
require 'unirest'

module SfMobileFoodFacilities
  class Facility

    attr_reader :address, :applicant, :dayshours, :facilitytype, :fooditems

    def initialize(hash)
      @address = hash["address"]
      @applicant = hash["applicant"]
      @dayshours = hash["dayshours"]
      @facilitytype = hash["facilitytype"]
      @fooditems = hash["fooditems"]
    end

    def self.all
      facilities_array = Unirest.get("https://data.sfgov.org/resource/6a9r-agq8.json").body
      facilities = []
      facilities_array.each do |facility_hash|
          facilities << Facility.new(facility_hash)
      end
      return facilities
    end
  end
end
