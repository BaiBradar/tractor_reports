Factory.define :user do |user|
	user.name "Krasi Kirilov"
	user.email "mnogogotin@email.com"
  user.company "Mlad Zemedelec"
	user.password "foobar"
	user.password_confirmation "foobar"
end
	
Factory.define :tractor do |tractor|
  tractor.registration "BT5107"
  tractor.code "5107"
  tractor.current_fuel 0.0
end

Factory.define :driver do |driver|
  driver.name "Emil Borisov"
end