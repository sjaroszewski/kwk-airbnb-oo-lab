require_relative 'host.rb'

class Listing
    attr_accessor :host, :beds, :dates_available, :cancellation, :guest, :reviews, :price
    def initialize(host,beds,dates,price)
        @host = host
        @beds = beds
        @dates_available = dates
        @cancellation = "strict"
        @guest = []
        @reviews = {}
        @price = price
    end
    
    def reserve_and_pay(name,nights)
        @guest.push(name)
        total = @price * nights
        return total.round(2)
    end
    
    def leave_review(guest_name,text)
        guest_name = guest_name.to_sym
        @reviews[guest_name] = text
    end
end

hotel = Listing.new("Taylor", 2, "02/06/2002", 2.00)
hotel.reserve_and_pay("Karlie",2)
hotel.leave_review("Karlie","Kloss")
puts hotel.guest
puts hotel.reviews