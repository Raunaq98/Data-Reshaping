data<- mtcars

library(reshape2)

head(data)
#                   mpg  cyl disp  hp  drat   wt  qsec vs am gear carb
#Mazda RX4         21.0   6  160  110 3.90 2.620 16.46  0  1    4    4
#Mazda RX4 Wag     21.0   6  160  110 3.90 2.875 17.02  0  1    4    4
#Datsun 710        22.8   4  108   93 3.85 2.320 18.61  1  1    4    1
#Hornet 4 Drive    21.4   6  258  110 3.08 3.215 19.44  1  0    3    1
#Hornet Sportabout 18.7   8  360  175 3.15 3.440 17.02  0  0    3    2
#Valiant           18.1   6  225  105 2.76 3.460 20.22  1  0    3    1


################## melting


data$carnames<- rownames(data)

carmelt <- melt(data, id=c("carnames","gear","cyl"),measure.vars = c("mpg","hp"))
carnames gear cyl variable value
#1            Mazda RX4    4   6      mpg  21.0
#2        Mazda RX4 Wag    4   6      mpg  21.0
#                     ...
#                     ...
#31       Maserati Bora    5   8      mpg  15.0
#32          Volvo 142E    4   4      mpg  21.4

#33           Mazda RX4    4   6       hp 110.0
#34       Mazda RX4 Wag    4   6       hp 110.0
#                   ...
#                   ...
#63       Maserati Bora    5   8       hp 335.0
#64          Volvo 142E    4   4       hp 109.0

#hence, data was sorted by ids= carnames, gear and cyl
# then it was given shape based on variable values of mpg and hp


################ casting

cyldata <- dcast(data,cyl ~ mpg)