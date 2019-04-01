class Admins::LandingPageController < ApplicationController
  layout "admins"
  def index
  end
end

# class PagesController < ApplicationController
#   layout "fullwidth", except: [:index, :faqs]

#   def popout
#     # Render this action with specific layout
#     render layout: "popout"
#     #renders with views/layouts/popout.html.erb
#   end

#   def index
#     #renders with views/layouts/application.html.erb
#   end

#   def about_us
#     #renders with views/layouts/fullwidth.html.erb
#   end

#   def team
#     #renders with views/layouts/fullwidth.html.erb
#   end

#   def logo
#     #renders with views/layouts/fullwidth.html.erb
#   end

#   def faqs
#     #renders with views/layouts/application.html.erb
#   end
# end