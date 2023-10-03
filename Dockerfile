# Usar una imagen base de Python
FROM python:3.11-slim

# Definir el directorio de trabajo
WORKDIR /app

# Copiar los archivos de requerimientos e instalar dependencias
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el resto de los archivos de la aplicación
COPY . .

# Exponer el puerto por el cual Flask correrá, generalmente 5000
EXPOSE 5000

# Definir la variable de entorno para indicar que Flask debe correr en modo producción
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
#ENV FLASK_ENV=production

# Iniciar la aplicación Flask
CMD ["flask", "run"]
