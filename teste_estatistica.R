# --- Teste de Script: Simulação de Dados Genéticos ---

# 1. Criando um conjunto de dados simples
# Vamos simular a altura de plantas (em cm) de dois grupos: Controle e Tratado
set.seed(123) # Garante que os números aleatórios sejam os mesmos sempre
dados <- data.frame(
  grupo = rep(c("Controle", "Tratado"), each = 20),
  altura = c(rnorm(20, mean = 50, sd = 5), rnorm(20, mean = 58, sd = 5))
)

# 2. Visualizando as primeiras linhas do seu "experimento"
head(dados)

# 3. Calculando uma estatística básica (Média por grupo)
aggregate(altura ~ grupo, data = dados, FUN = mean)

# 4. Criando um gráfico de comparação (Boxplot)
boxplot(altura ~ grupo, data = dados,
        main = "Crescimento de Plantas",
        xlab = "Grupo Experimental",
        ylab = "Altura (cm)",
        col = c("skyblue", "lightgreen"))

# 5. Teste Estatístico (Teste t de Student)
# Para ver se a diferença entre os grupos é significativa (p < 0.05)
resultado_teste <- t.test(altura ~ grupo, data = dados)
print(resultado_teste)