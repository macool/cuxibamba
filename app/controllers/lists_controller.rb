class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find params[:id]
    #@tweets = twitter_client.search("#Carchi").take(10)
    @tweets = Tweet.all    
  end

  def create
    @list = List.new(list_params)
    @list.save!

    @tweets = twitter_client.search("#{list_params[:name]}").take(10)
    @tweets.each do |tweet|
      Tweet.create({
          user: tweet.user.name,
          content: tweet.text,
          id_str: tweet.id.to_s
      })
    end
     
    redirect_to action: :show, id: @list.id
    #redirect_to action: :show, id: @list.id
  end

  private

  def list_params
    params.require(:list)
          .permit(:name)
  end

  def twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = "efjOrToCbUf6JJphiIN9A"
      config.consumer_secret     = "WdxYZnRK4L0HBpNfWwUIC3FEC0iIKktGxnSgLSw"
      config.access_token        = "637192024-qCTlaSioqhmhHlGfRkUyJhot6q9SI8etZlPmdK3a"
      config.access_token_secret = "ervh9CuhKJPTaaMqXlfpV6miRJyPeZ5dnROO93EM"
    end
  end
  
 
end
