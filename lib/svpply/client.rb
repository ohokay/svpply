module Svpply
  module Client
    include HTTParty
    base_uri "https://api.svpply.com/v1"

    def self.get_response(url, attrs=nil)
      params = attrs ? prune_attributes(attrs) : {}
      get(url, query: params)["response"]
    end

    private
      def self.prune_attributes(attributes)
        query = attributes.first if attributes.first.is_a?(String)
        params = attributes.last.is_a?(Hash) ? attributes.last : {}
        if params
          params[:filters] = {}
          if params[:genders]
            genders = params.delete(:genders)
            params[:filters][:genders] = [genders].flatten
          end
          if params[:prices]
            prices = params.delete(:prices)
            params[:filters][:prices] = [prices].flatten
          end
        end
        return params.merge!({ q: query })
      end

  end
end
