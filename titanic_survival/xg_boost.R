#quick note about data
  #split cabin number, see if association with letter or number or number of numbers? location on ship maybe
set.seed(9898)
boxplot(train_data$Survived)
summary(train_data$Survived)



#should think about down/upsampling
train(
  train_data[,colnames(train_data) != 'Survived'],
  train_data$Survived,
  method = 'xgbTree'
  )