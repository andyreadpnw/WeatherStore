require_relative '../config/environment.rb'

@user_zip = User.last
zip_code = @user_zip.zip_code

#get the body data from REst
weatherresponse = RestClient.get("http://api.openweathermap.org/data/2.5/weather?zip=#{zip_code},us&APPID=c7e07ac1ee16d6a130ce8d234f928774")

#format the data as JSON with JSON.parse
json_data = JSON.parse(weatherresponse)

main = json_data["main"]["temp"]

    temp = main
    user_id = 1
    Temperature.create(user_id: user_id, temp: temp)



