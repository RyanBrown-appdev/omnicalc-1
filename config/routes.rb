Rails.application.routes.draw do
  get("/square/new", {:controller => "application", :action => "blank_square_form"})
  get("/", {:controller => "application", :action => "blank_square_form"})
  get("/random/new", {:controller => "application", :action => "blank_random_form"})
  get("/payment/new", {:controller => "application", :action => "blank_payment_form"})
  get("/square_root/new", {:controller => "application", :action => "blank_square_root_form"})
  get("/square/results", {:controller => "application", :action => "calculate_square"})
  get("/random/results", {:controller => "application", :action => "calculate_random"})
  get("/square_root/results", {:controller => "application", :action => "calculate_square_root"})
  get("/payment/results", {:controller => "application", :action => "calculate_payment"})
end
