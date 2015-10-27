username = "folays"
password = "xxxxxxxx"
dbname = "test"

mysql = require("mysql")

link = mysql.connect("localhost",username,password,test)

link:query("show tables")

repeat
  t = link:fetch_array()
  if (t) then
      print(t[1])
  end
until not t
