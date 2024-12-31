# This will fetch all the list of clients that can be added into appointments
# Have to call with Service.new.fetch_active so we can instantiate the service to call from.
class Client
  class List
    def initialize
    end

    def fetch_active
      Client.all
    end
  end
end
