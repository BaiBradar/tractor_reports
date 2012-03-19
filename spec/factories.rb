Factory.define :user do |user|
  user.id 1
	user.name "Krasi Kirilov"
	user.email "mnogogotin@email.com"
  user.company "Mlad Zemedelec"
	user.password "foobar"
	user.password_confirmation "foobar"
end
	
Factory.define :tractor do |tractor|
  tractor.user_id 1
  tractor.registration "BT5107"
  tractor.code "5107"
  tractor.current_fuel 0.0
end

Factory.define :tractor_driver do |tractor_driver|
  tractor_driver.user_id 1
  tractor_driver.name "Emil Borisov"
end

#Factory.define :report do |report|
  #report.user_id 1
  #report.date "2012-02-13"
  #report.decker 30.0
  #report.operation_name "Dulboka oran"
  #report.tractor_code "5107"
  #report.tractor_driver_name "Emil Borisov"
 # report.land_name "Obnova"
#end