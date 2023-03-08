FROM python:3.10

# Install pipenv 
RUN pip3 install pipenv

# Setting the working directory 
WORKDIR /app 
 
# Install pipenv dependencies 
COPY Pipfile Pipfile.lock ./ 
RUN pipenv update && pipenv install --system --deploy

# Copying our application into the container 
COPY todo todo

# Running our application and adding a delay to our application startup 
CMD ["sleep", "10", "&&", "flask", "--app", "todo", "run", "--host", "0.0.0.0", "--port", "6400"]