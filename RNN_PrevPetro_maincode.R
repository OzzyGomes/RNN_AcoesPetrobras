#Main Librarys
library("rnn")
library("ggplot2")
library("dplyr")

#lendo dataset
df <- read.csv("PETR4.SA.csv")

#pegando dados do fechamento das ações
fechamento <- df$Close

# desejo prever os valores de amanhã com base nos valores de ontem. y(t) = f(y(t-1))

#criando uma associação entre os valores com lag
fechamento_anterior <- lead(fechamento, n=1L)

#criando dataframe
data_analise <- data.frame(fechamento)
data_analise$fechamento_anterior <- fechamento_anterior


#pre-processamento
#excluindo a ultima linha
data_analise <- data_analise[1:248,]

x <- data_analise[,2]
y <- data_analise[,1]

X <- matrix(x, nrow = 31)
Y <- matrix(y, nrow = 31)

Yscaled <- (Y - min(Y)) / (max(Y) - min(Y))
Xscaled <- (X - min(X)) / (max(X) - min(X))

Y <- Yscaled
X <- Xscaled

train=1:6
test=7:8

#trainando o modelo RNN
set.seed(12)

model <- trainr(Y = Y[,train],
                X = X[,train],
                learningrate = 0.04,
                hidden_dim = 20,
                numepochs = 1000,
                network_type = "rnn"
                )

#no conjunto de treinamento 
Ytrain <- t(matrix(predictr(model, X[, train]), nrow = 1))
Yreal <- t(matrix(Y[, train], nrow = 1))

#Percentual de variação em uma variável explicada por outra
rsq <- function(y_actual,y_predict){
  cor(y_actual,y_predict)^2
}

rsq(Yreal,Ytrain)

#trazendo para uma informação visual
plot(Ytrain, type = "l", col = "darkred",
main = "Actual vs Predicted Closed Price: testing set",
ylab = "Yreal,Ytrain")
lines(Yreal, col = "darkblue", type = "l")
legend("bottomright", c("Predicted", "Actual"),
col = c("red","darkblue"),
lty = c(1,1), lwd = c(1,1))

#acuracia no conjunto de teste
Ytest <- matrix(Y[,test], nrow = 1)
Ytest <- t(Ytest)

#predizendo modelo
Yp <- predictr(model, Y[,test])
Ypredicted <- matrix(Yp, nrow = 1)
Ypredicted <- t(Ypredicted)

#criando dataframe
result_data <- data.frame(Ytest)
result_data$Ypredicted <- Ypredicted

#função de correlação de resultados
rsq(result_data$Ytest,result_data$Ypredicted)

#mdia dos resultados
mean(result_data$Ytest)
mean(result_data$Ypredicted)


