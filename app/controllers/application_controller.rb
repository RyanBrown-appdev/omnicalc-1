class ApplicationController < ActionController::Base
  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb"})
  end
  def blank_random_form
    render({ :template => "calculation_templates/random_form.html.erb"})
    
  end

  def blank_square_root_form
    render({ :template => "calculation_templates/square_root_form.html.erb"})
    
  end

  def blank_payment_form
    render({ :template => "calculation_templates/payment_form.html.erb"})
    
  end

  def calculate_square
    @num = params.fetch("number").to_f
    @square_of_num = @num * @num
    render({ :template => "calculation_templates/square_results.html.erb"})
  end
  def calculate_random
    @upper = params.fetch("user_max").to_f
    @lower = params.fetch("user_min").to_f
    render({:template  => "calculation_templates/random_results.html.erb"})
  end

  def calculate_square_root
    @num1 = params.fetch("sr1").to_f
    @sr_of_num1 = Math.sqrt(@num1)
    render({:template  => "calculation_templates/square_root_results.html.erb"})
  end

  def calculate_payment
    @apr = params.fetch("apr").to_f
    @years = params.fetch("years").to_f
    @principal = params.fetch("principal").to_f

    @final_apr =('%.4f' % @apr.round(4)) + "%"#.to_s(:percentage)
    @final_year = @years.to_i.to_s
    @final_principal = @principal.to_s(:currency)
    n = @years.to_i * 12
    r = @apr / n
    nn = r * @principal
    d = 1 - (1 + r) ** -n
    rate = @apr / 100
    i = (1+rate/12)**(12/12)-1
    annuity = (1-(1/(1+i))**n)/i 
    payment = @principal/annuity
    @final_paymnet = payment.to_s(:currency)
    render({:template  => "calculation_templates/payment_results.html.erb"})
  end

end
