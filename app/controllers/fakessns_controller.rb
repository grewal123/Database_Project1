class FakessnsController < ApplicationController


def index
  @fakessns = Fakessn.all
end
end
