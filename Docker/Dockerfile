FROM ubuntu:24.04

# Instala o compilador C (gcc)
RUN apt-get update && apt-get install -y gcc

# Define diretório de trabalho
WORKDIR /src

# Copia o código fonte para dentro do container
COPY main.c /src/main.c

# Compila o programa
RUN gcc main.c -o main

# Executa o binário compilado ao rodar o container
CMD ["./main"]
server_name pedro.42.fr;